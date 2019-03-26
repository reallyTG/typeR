library(mvnTest)


### Name: CM.test
### Title: Cramer-von Mises test for Multivariate Normality
### Aliases: CM.test

### ** Examples

## Not run: 
##D ## generating n bivariate normal random variables...       
##D dat <- rmvnorm(n=100,mean=rep(0,2),sigma=matrix(c(4,2,2,4),2,2)) 
##D res <- CM.test(dat)
##D res
##D 
##D ## generating n bivariate t distributed with 10df random variables...       
##D dat <- rmvt(n=200,sigma=matrix(c(4,2,2,4),2,2),df=10,delta=rep(0,2)) 
##D res1 <- CM.test(dat)
##D res1
##D 
##D data(iris)
##D setosa <- iris[1:50, 1:4] # Iris data only for setosa
##D res2 <- CM.test(setosa, qqplot = TRUE)
##D res2
## End(Not run)



