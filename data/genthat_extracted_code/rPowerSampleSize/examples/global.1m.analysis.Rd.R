library(rPowerSampleSize)


### Name: global.1m.analysis
### Title: Data analysis with a global method in the context of multiple
###   continuous endpoints
### Aliases: global.1m.analysis
### Keywords: package multivariate models multiple testing data analysis

### ** Examples

# Calling the data
data(data.sim)

# Data analysis for the global method
n <- nrow(data) / 2

XC <- data[1:n, 1:3]
XT <- data[(n + 1):(2 * n), 1:3]

global.1m.analysis(XC = XC, XT = XT, A = data[, 5])



