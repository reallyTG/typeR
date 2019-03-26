library(bcgam)


### Name: summary.bcgam
### Title: Summarizing 'bcgam' fits
### Aliases: summary.bcgam

### ** Examples

## Not run: 
##D n<-50
##D x<-(1:n)^{1/3}
##D z<-as.factor(rbinom(n, 1, 0.6))
##D y<-x+7*as.numeric(z)+rnorm(n,sd=2) 
##D bcgam.fit <- bcgam(y~sm.incr(x)+z, nloop=100)
##D summary(bcgam.fit)
## End(Not run)



