library(mvnTest)


### Name: S2.test
### Title: Chi-squared type tests for Multivariate Normality
### Aliases: S2.test

### ** Examples

## generating n bivariate normal random variables...       
dat <- rmvnorm(n=200,mean=rep(0,2),sigma=matrix(c(4,2,2,4),2,2)) 
res <- S2.test(dat, qqplot = FALSE)
res
## generating n bivariate t distributed with 10df random variables...       
dat <- rmvt(n=200,sigma=matrix(c(4,2,2,4),2,2)*.8,df=10,delta=rep(0,2)) 
res1 <- S2.test(dat, qqplot = TRUE)
res1

data(iris)
setosa = iris[1:50, 1:4] # Iris data only for setosa
res2 <- S2.test(setosa, qqplot = TRUE)
res2




