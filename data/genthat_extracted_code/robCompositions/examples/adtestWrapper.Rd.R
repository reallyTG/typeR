library(robCompositions)


### Name: adtestWrapper
### Title: Wrapper for Anderson-Darling tests
### Aliases: adtestWrapper print.adtestWrapper summary.adtestWrapper
###   print.adtestWrapper summary.adtestWrapper
### Keywords: htest

### ** Examples


data(machineOperators)
a <- adtestWrapper(machineOperators, R=50) # choose higher value of R
a
summary(a)




