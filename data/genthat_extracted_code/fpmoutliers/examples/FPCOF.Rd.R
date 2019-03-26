library(fpmoutliers)


### Name: FPCOF
### Title: FPCOF algorithm
### Aliases: FPCOF

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- FPCOF(dataFrame, minSupport = 0.001)



