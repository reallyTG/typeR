library(MAINT.Data)


### Name: mle-methods
### Title: Methods for function mle in Package 'MAINT.Data'
### Aliases: mle-methods mle,IData-method mle
### Keywords: methods maximum likelihood estimation interval data

### ** Examples

# Create an Interval-Data object containing the intervals of temperatures by quarter 
# for 899 Chinese meteorological stations.

ChinaT <- IData(ChinaTemp[1:8])

# Estimate parameters by maximum likelihood, assuming that one of 
# the C2, C3 or C4 restricted Covariance configurations holds

ChinaE <- mle(ChinaT,CovCase=2:4)
cat("China maximum likelhiood estimation results =\n")
print(ChinaE)
cat("Standard Errors of Estimators:\n")
print(stdEr(ChinaE))



