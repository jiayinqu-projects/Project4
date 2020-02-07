#R Studio API Code
library(rstudioapi)
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#Data Import
library(tidyverse)
week4_df <- read.delim("../data/week4.dat", sep = "-", col.names = c("casenum", "parnum", "stimver", "datadate", "qs"))
str(week4_df)
week4_df <- separate(week4_df, qs, c("q1", "q2", "q3", "q4", "q5"), sep = " - ")
week4_df[,c(5:9)] <- sapply(week4_df[,c(5:9)], as.integer)
week4_df[,c(5:9)][which(week4_df[,c(5:9)] == 0, arr.ind = TRUE)] <- NA




library(lubridate)
week4_df$datadate <- mdy_hms(week4_df$datadate)

#Data Analysis
q2_over_time_df <- spread(week4_df[,c(2, 3, 6)], stimver, q2)
nrow(na.omit(q2_over_time_df))/nrow(q2_over_time_df)