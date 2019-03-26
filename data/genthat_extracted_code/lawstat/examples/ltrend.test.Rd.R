library(lawstat)


### Name: ltrend.test
### Title: Test for a linear trend in variances
### Aliases: ltrend.test
### Keywords: htest

### ** Examples


data(pot)
ltrend.test(pot[,"obs"], pot[,"type"], location="median", tail="left", 
correction.method="zero.correction")

##   ltrend test based on the modified Brown-Forsythe Levene-type procedure using the 
##   group medians with modified structural zero removal method and correction factor 
##   (left-tailed with Pearson correlation coefficient)
##
## data:  pot[, "obs"] 
## Test Statistic (Correlation) = -0.1929, p-value = 0.0001735

##   Bootstrap version of the test. The calculation may take up a few minutes 
##   depending on the number of bootstrap sampling.

ltrend.test(pot[,"obs"], pot[,"type"], location="median", tail="left", 
correction.method="zero.correction",bootstrap=TRUE,num.bootstrap=500)

##   bootstrap ltrend test based on the modified Brown-Forsythe Levene-type procedure 
##   using the group medians with modified structural zero removal method and correction factor
##   (left-tailed with Pearson correlation coefficient)
##
## data:  pot[, "obs"] 
## Test Statistic (Correlation) = -0.1929, p-value = 0.0002




