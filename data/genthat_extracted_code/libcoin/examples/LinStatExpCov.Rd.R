library(libcoin)


### Name: LinStatExpCov
### Title: Linear Statistics with Expectation and Covariance
### Aliases: LinStatExpCov lmult
### Keywords: htest

### ** Examples


 wilcox.test(Ozone ~ Month, data = airquality,
             subset = Month %in% c(5, 8))

 aq <- subset(airquality, Month %in% c(5, 8))
 X <- as.double(aq$Month == 5)
 Y <- as.double(rank(aq$Ozone))

 doTest(LinStatExpCov(X, Y))




