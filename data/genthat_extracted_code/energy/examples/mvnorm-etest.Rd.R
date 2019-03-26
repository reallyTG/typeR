library(energy)


### Name: mvnorm.etest
### Title: E-statistic (Energy) Test of Multivariate Normality
### Aliases: mvnorm.etest mvnorm.e normal.e
### Keywords: multivariate htest

### ** Examples

 ## compute normality test statistics for iris Setosa data
 data(iris)
 mvnorm.e(iris[1:50, 1:4])
 normal.e(iris[1:50, 1])

 ## test if the iris Setosa data has multivariate normal distribution
 mvnorm.etest(iris[1:50,1:4], R = 199)

 ## test a univariate sample for normality
 x <- runif(50, 0, 10)
 mvnorm.etest(x, R = 199)
 


