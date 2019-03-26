library(bcgam)


### Name: plot.bcgam
### Title: 2D plots for 'bcgam' fits
### Aliases: plot.bcgam
### Keywords: internal

### ** Examples

## Not run: 
##D n<-50
##D x1<-(1:n/n)^{1/3}
##D x2<-log(1:n/n)
##D z<-as.factor(rbinom(n, 1, 0.6))
##D eta<-x1+x2+0.2*as.numeric(z)+rnorm(n, sd=0.2)
##D mu<-exp(eta)/(1+exp(eta))
##D y<-(mu<0.6)
##D 
##D bcgam.fit <- bcgam(y~sm.incr(x1)+sm.conc(x2, numknots=8)+z, nloop=10000, family="binomial")
##D plot(bcgam.fit, x1, parameter="mu", col=4, level=0.90)
##D plot(bcgam.fit, x2, parameter="eta", col=3, col.inter=2)
## End(Not run)



