library(ICS)


### Name: mvnorm.kur.test
### Title: Test of Multivariate Normality Based on Kurtosis
### Aliases: mvnorm.kur.test
### Keywords: htest multivariate

### ** Examples

X<-rmvnorm(100, c(2, 4, 5))
mvnorm.kur.test(X)
mvnorm.kur.test(X, method = "satt")
mvnorm.kur.test(X, method = "simu")



