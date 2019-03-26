library(bcgam)


### Name: bcgam
### Title: Fitting Bayesian Constrained Generalised Additive Models
### Aliases: bcgam

### ** Examples

## Not run: 
##D ## Example 1 (gaussian)
##D data(duncan)
##D 
##D bcgam.fit <- bcgam(income~sm.incr(prestige, space="E")+sm.conv(education)+type, data=duncan)
##D print(bcgam.fit)
##D summary(bcgam.fit)
##D plot(bcgam.fit, prestige, col=4)
##D persp(bcgam.fit, prestige, education, level=0.90)
##D 
##D 
##D ## Example 2 (poisson)
##D set.seed(2018)
##D n<-50
##D x1<-sqrt(1:n)
##D z<-as.factor(rbinom(n, 1, 0.5))
##D log.eta<-x1/7+0.2*as.numeric(z)+rnorm(50, sd=0.6)
##D eta<-exp(log.eta)
##D y<-rpois(n,eta)
##D 
##D bcgam.fit <- bcgam(y~sm.conv(x1)+z, family="poisson")
##D summary(bcgam.fit)
##D predict(bcgam.fit, newdata=data.frame(x1=0.2, z="0"), interval="credible")
##D plot(bcgam.fit, x1, col=3, col.inter=4)
## End(Not run)



