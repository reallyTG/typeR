library(highfrequency)


### Name: rBeta
### Title: Realized beta: a tool in measuring risk with respect to the
###   market.
### Aliases: rBeta
### Keywords: highfrequency rBeta

### ** Examples

data(sample_5minprices_jumps)
a=sample_5minprices_jumps['2010-01-04',1]
b=sample_5minprices_jumps['2010-01-04',2]

rBeta(a,b,RCOVestimator="rBPCov",RVestimator="minRV",makeReturns=TRUE)



