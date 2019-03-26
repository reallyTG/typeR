library(discSurv)


### Name: dataLongCompRisksTimeDep
### Title: Data Long Competing Risks Time Dependent Covariates
###   Transformation
### Aliases: dataLongCompRisksTimeDep
### Keywords: datagen

### ** Examples

# Example Primary Biliary Cirrhosis data
library(survival)

# Convert to months
pbcseq$day <- ceiling(pbcseq$day/30)+1
names(pbcseq) [7] <- "month"
pbcseq$status <- factor(pbcseq$status)

# Convert to long format for time varying effects
pbcseqLong <- dataLongCompRisksTimeDep(dataSet=pbcseq, timeColumn="month", 
eventColumns="status", eventColumnsAsFactor=TRUE, idColumn="id", 
timeAsFactor=TRUE)
head(pbcseqLong)



