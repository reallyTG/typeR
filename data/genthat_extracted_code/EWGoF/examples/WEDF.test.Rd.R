library(EWGoF)


### Name: WEDF.test
### Title: GoF tests based on the empirical distribution function for the
###   Weibull distribution
### Aliases: WEDF.test
### Keywords: Cramer-von-Mises test Anderson-Darling test
###   Kolmogorov-Smirnov test Liao and Shimokawa test Kullback-Lebler
###   information Empirical distribution function

### ** Examples


x1 <- rweibull(50,2,3)

#Apply Kolmogorov-Smirnov test with maximum likelihood estimators
WEDF.test(x1,type="KS",funEstimate="MLE")

x2 <- rlnorm(50,0.2)

#Apply the Liao and Shimokawa test using the least squares estimators
WEDF.test(x2,type="LS",funEstimate="LSE")

#Apply the Cramer-von Mises test with the moment estimators
WEDF.test(x2,type="CM",funEstimate="ME")

#Apply the test based on the Kullback-Leibler information with the moment estimators
WEDF.test(x2,type="KL",funEstimate="ME")



