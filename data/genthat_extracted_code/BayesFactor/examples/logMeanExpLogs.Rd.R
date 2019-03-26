library(BayesFactor)


### Name: logMeanExpLogs
### Title: Functions to compute the logarithm of the mean (and cumulative
###   means) of vectors of logarithms
### Aliases: logMeanExpLogs logCumMeanExpLogs logSummaryStats
### Keywords: arith misc

### ** Examples


# Sample 100 values
y = log(rexp(100,1))

# These will give the same value,
# since e^y is "small"
logMeanExpLogs(y)
log(mean(exp(y)))

# We can make e^x overflow by multiplying
# e^y by e^1000
largeVals = y + 1000

# This will return 1000 + log(mean(exp(y)))
logMeanExpLogs(largeVals)

# This will overflow
log(mean(exp(largeVals)))




