library(lawstat)


### Name: neuhauser.hothorn.test
### Title: Neuhauser-Hothorn double contrast test for a monotonic trend in
###   variances
### Aliases: neuhauser.hothorn.test
### Keywords: htest

### ** Examples


library(mvtnorm)
data(pot)
neuhauser.hothorn.test(pot[,"obs"], pot[,"type"], location="median", tail="left", 
correction.method="zero.correction")

##   double contrast test based on the absolute deviations from the median with 
##   group medians with modified structural zero removal method and correction factor 
##   (left-tailed)
##
## data:  pot[, "obs"] 
## Test Statistic = -3.6051, p-value = 0.0003021

##   Bootstrap version of the test. The calculation may take up a few minutes 
##   depending on the number of bootstrap sampling.

neuhauser.hothorn.test(pot[,"obs"], pot[,"type"], location="median", tail="left", 
correction.method="zero.correction", bootstrap=TRUE, num.bootstrap=500)

##   bootstrap double contrast test based on the absolute deviations from the median with 
##   modified structural zero removal method and correction factor 
##   (left-tailed)
##
## data:  pot[, "obs"] 
## Test Statistic = -3.6051, p-value = 0.0001




