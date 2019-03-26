library(lawstat)


### Name: lnested.test
### Title: Test for a monotonic trend in variances
### Aliases: lnested.test
### Keywords: htest

### ** Examples


data(pot)
lnested.test(pot[,"obs"], pot[,"type"], location="median", tail="left", 
correction.method="zero.correction")$N

##   lnested test based on the modified Brown-Forsythe Levene-type procedure using the 
##   group medians with modified structural zero removal method and correction factor 
##   (left-tailed with Pearson correlation coefficient)
##
## data:  pot[, "obs"] 
## Test Statistic (N) = 4.905, p-value = 0.0002618

lnested.test(pot[,"obs"], pot[,"type"], location="median", tail="left", 
correction.method="zero.correction",bootstrap=TRUE,num.bootstrap=500)$N

##   bootstrap lnested test based on the modified Brown-Forsythe Levene-type procedure 
##   using the group medians with modified structural zero removal method and correction 
##   factor (left-tailed with Pearson correlation coefficient)
##
## data:  pot[, "obs"] 
## Test Statistic (N) = 4.9936, p-value = 0.000207




