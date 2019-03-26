library(bcgam)


### Name: predict.bcgam
### Title: Predict method for 'bcgam' fits
### Aliases: predict.bcgam
### Keywords: internal

### ** Examples

## Not run: 
##D n<-50
##D x<-(1:n)^{1/3}
##D z<-as.factor(rbinom(n, 1, 0.6))
##D y<-x+7*as.numeric(z)+rnorm(n,sd=2) 
##D bcgam.fit <- bcgam(y~sm.incr(x)+z, nloop=100)
##D predict(bcgam.fit, newdata=data.frame(x=0.5, z="1"), parameter="mu", interval="prediction")
## End(Not run)



