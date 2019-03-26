library(asbio)


### Name: anm.loglik
### Title: Animated plots of log-likelihood functions
### Aliases: anm.loglik loglik.plot loglik.norm.plot loglik.pois.plot
###   loglik.binom.plot loglik.exp.plot loglik.custom.plot anm.loglik.tck
### Keywords: univar graphs

### ** Examples


## Not run: 
##D ##Normal log likelihood estimation of mu.
##D X<-c(11.2,10.8,9.0,12.4,12.1,10.3,10.4,10.6,9.3,11.8)
##D anm.loglik(X,dist="norm",parameter="mu")
##D 
##D ##Add a plot describing log-likelihood calculation.
##D anm.loglik(X,dist="norm",parameter="mu",plot.calc=TRUE)
##D 
##D ##Normal log likelihood estimation of sigma squared.
##D X<-c(11.2,10.8,9.0,12.4,12.1,10.3,10.4,10.6,9.3,11.8)
##D anm.loglik(X,dist="norm",parameter="sigma.sq")
##D 
##D ##Exponential log likelihood estimation of theta
##D X<-c(0.82,0.32,0.14,0.41,0.09,0.32,0.74,4.17,0.36,1.80,0.74,0.07,0.45,2.33,0.21,
##D 0.79,0.29,0.75,3.45)
##D anm.loglik(X,dist="exp")
##D 
##D ##Poisson log likelihood estimation of lambda.
##D X<-c(1,3,4,0,2,3,4,3,5)
##D anm.loglik(X,dist="poi")
##D 
##D ##Binomial log likelihood estimation of p.
##D X<-c(1,1,0,0,0,1,0,0,0,0)#where 1 = a success
##D anm.loglik(X,dist="bin",interval=.2)
##D 
##D ##Custom log-likelihood function
##D func<-function(X=NULL,theta)theta^5*(1-theta)^10
##D anm.loglik(X=NULL,func=func,dist="custom",poss=seq(0,1,0.01),
##D xlab="Possibilities",ylab="Log-likelihood")             
##D 
##D ##Interactive GUI, requires package 'tcltk'
##D anm.loglik.tck()
## End(Not run)



