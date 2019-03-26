library(lawstat)


### Name: robust.mmm.test
### Title: Robust Mudholkar-McDermott-Mudholkar test for ordered variances
### Aliases: robust.mmm.test
### Keywords: htest

### ** Examples


data(pot)
robust.mmm.test(pot[,"obs"], pot[,"type"], tail="left")$N

##   Mudholkar et al. (1995) test (left-tailed)
##
## data:  pot[, "obs"] 
## Test Statistic (N) = 7.4079, p-value = 8.109e-08




