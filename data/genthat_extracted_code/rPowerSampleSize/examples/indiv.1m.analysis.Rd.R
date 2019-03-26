library(rPowerSampleSize)


### Name: indiv.1m.analysis
### Title: Data analysis with an individual testing procedure in the
###   context of multiple continuous endpoints
### Aliases: indiv.1m.analysis fwer test.indiv
### Keywords: package individual procedure multiple testing data analysis

### ** Examples

# Calling the data
data(data.sim)

# Data analysis for the individual method
n <- nrow(data) / 2 

XC <- data[1:n, 1:3]
XT <- data[(n + 1):(2 * n), 1:3]

indiv.1m.analysis(method = "UnKnown", XC = XC, XT = XT)



