library(logNormReg)


### Name: summary.lognlm
### Title: Summarizing model fits for log Normal regression
### Aliases: summary.lognlm print.summary.lognlm
### Keywords: regression

### ** Examples

## Not run: 
##D n=20
##D s=.2
##D set.seed(10)      #just to get reproducible results..
##D 
##D #covariates
##D x<-seq(.1,10,l=n) 
##D z<-rnorm(n)
##D 
##D #response
##D mu<- 10+.5*x- z  #linear regression function
##D y<-rlnorm(n, log(mu)-s^2/2, s) #data..
##D 
##D o<- lognlm(y~x+z) #the model
##D summary(o, sandw=TRUE)
## End(Not run)



