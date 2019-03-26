library(fpmoutliers)


### Name: FPOF
### Title: FPOF - Frequent Pattern Outlier Factor algorithm
### Aliases: FPOF

### ** Examples

library("fpmoutliers")
dataFrame <- read.csv(
     system.file("extdata", "fp-outlier-customer-data.csv", package = "fpmoutliers"))
model <- FPOF(dataFrame, minSupport = 0.001)



