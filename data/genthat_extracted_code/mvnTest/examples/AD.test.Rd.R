library(mvnTest)


### Name: AD.test
### Title: Anderson-Darling test for multivariate normality
### Aliases: AD.test

### ** Examples

## Not run: 
##D ## generating n bivariate normal random variables...       
##D dat <- rmvnorm(n=100,mean=rep(0,2),sigma=matrix(c(4,2,2,4),2,2)) 
##D res <- AD.test(dat)
##D res
##D 
##D ## generating n bivariate t distributed with 10df random variables...   
##D dat <- rmvt(n=200,sigma=matrix(c(4,2,2,4),2,2),df=10,delta=rep(0,2)) 
##D res1 <- AD.test(dat)
##D res1
##D 
##D data(iris)
##D setosa <- iris[1:50, 1:4] # Iris data only for setosa
##D res2 <- AD.test(setosa, qqplot = TRUE)
##D res2
##D 
##D     
## End(Not run)



