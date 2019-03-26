library(discSurv)


### Name: dataLongTimeDep
### Title: Data Long Time Dependent Covariates
### Aliases: dataLongTimeDep
### Keywords: datagen

### ** Examples

# Example Primary Biliary Cirrhosis data
library(survival)
dataSet1 <- pbcseq

# Only event death is of interest
dataSet1$status [dataSet1$status==1] <- 0
dataSet1$status [dataSet1$status==2] <- 1
table(dataSet1$status)

# Convert to months
dataSet1$day <- ceiling(dataSet1$day/30)+1
names(dataSet1) [7] <- "month"

# Convert to long format for time varying effects
pbcseqLong <- dataLongTimeDep (dataSet=dataSet1, timeColumn="month", 
censColumn="status", idColumn="id")
pbcseqLong [pbcseqLong$obj==1, ]



