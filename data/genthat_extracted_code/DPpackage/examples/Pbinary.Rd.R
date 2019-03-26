library(DPpackage)


### Name: Pbinary
### Title: Bayesian analysis for a parametric Bernoulli regression model
### Aliases: Pbinary Pbinary.default
### Keywords: models

### ** Examples

## Not run: 
##D     # Bioassay Data Example
##D     # Cox, D.R. and Snell, E.J. (1989). Analysis of Binary Data. 2nd ed. 
##D     # Chapman and Hall. p. 7  
##D     # In this example there are 150 subjects at 5 different stimulus levels, 
##D     # 30 at each level.
##D 
##D       y<-c(rep(0,30-2),rep(1,2),
##D            rep(0,30-8),rep(1,8),
##D            rep(0,30-15),rep(1,15),
##D            rep(0,30-23),rep(1,23),
##D            rep(0,30-27),rep(1,27))
##D 
##D       x<-c(rep(0,30),
##D            rep(1,30),
##D            rep(2,30),
##D            rep(3,30),
##D            rep(4,30))
##D 
##D     # Initial state
##D       state <- NULL
##D 
##D     # MCMC parameters
##D       nburn<-5000
##D       nsave<-5000
##D       nskip<-10
##D       ndisplay<-1000
##D       mcmc <- list(nburn=nburn,nsave=nsave,nskip=nskip,ndisplay=ndisplay,
##D                    tune=1.1)
##D 
##D 
##D     # Prior distribution
##D       prior <- list(beta0=rep(0,2), Sbeta0=diag(10000,2))
##D 
##D     # Fit a logistic regression model
##D       fit1 <- Pbinary(y~x,link="logit",prior=prior,
##D                       mcmc=mcmc,state=state,status=TRUE) 
##D       fit1
##D 
##D     # Fit a probit regression model
##D       fit2 <- Pbinary(y~x,link="probit",prior=prior, 
##D                       mcmc=mcmc,state=state,status=TRUE) 
##D       fit2
##D 
##D     # Fit a cloglog regression model
##D       fit3 <- Pbinary(y~x,link="cloglog",prior=prior,
##D                       mcmc=mcmc,state=state,status=TRUE) 
##D       fit3
##D 
##D     # Fit a cauchy regression model
##D       fit4 <- Pbinary(y~x,link="cauchy",prior=prior,
##D                       mcmc=mcmc,state=state,status=TRUE) 
##D       fit4
## End(Not run)      



