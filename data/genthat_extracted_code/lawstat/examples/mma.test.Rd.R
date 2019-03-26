library(lawstat)


### Name: mma.test
### Title: Mudholkar-McDermott-Aumont test for ordered variances for normal
###   samples
### Aliases: mma.test
### Keywords: htest

### ** Examples


data(pot)
mma.test(pot[,"obs"], pot[,"type"], tail="left")$N

##   Mudholkar et al. (1993) test (left-tailed)
##
## data:  pot[, "obs"] 
## Test Statistic (N) = 9.9429, p-value = 1.028e-12




