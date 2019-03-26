library(lawstat)


### Name: levene.test
### Title: Levene's Test of Equality of Variances
### Aliases: levene.test
### Keywords: htest

### ** Examples


data(pot)
levene.test(pot[,"obs"], pot[,"type"], location="median", correction.method="zero.correction")

##        modified robust Brown-Forsythe Levene-type test based on the absolute deviations 
##        from the median with modified structural zero removal method and correction factor
##
## data:  pot[,"obs"] 
## Test Statistic = 6.5673, p-value = 0.001591

##   Bootstrap version of the test. The calculation may take up a few minutes 
##   depending on the number of bootstrap sampling.

levene.test(pot[,"obs"], pot[,"type"], location="median", correction.method="zero.correction", 
bootstrap=TRUE,num.bootstrap=500)

##        bootstrap modified robust Brown-Forsythe Levene-type test based on the absolute 
##        deviations from the median with structural zero removal method and correction factor
##
## data:  pot[, "obs"] 
## Test Statistic = 6.9577, p-value = 0.001




