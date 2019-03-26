library(bpcp)


### Name: fixtdiff
### Title: Two sample test for Difference in Survival at Fixed Time
### Aliases: fixtdiff
### Keywords: htest

### ** Examples

data(leuk2)
# Note that since the Kaplan-Meier survival at time=35 goes to 
# zero for one group, the results for the log and cloglog 
# transformations are undefined
fixtdiff(leuk2$time,leuk2$status,leuk2$treatment,35,doall=TRUE)




