library(GPRMortality)


### Name: GPRMortalityChild
### Title: Gaussian Process Regression for estimation and projection of
###   child (under-5) mortality rates
### Aliases: GPRMortalityChild

### ** Examples


 library("rstan")
 library("GPRMortality")
 head(data.mortality.child)
 head(data.mean.child)
 mortality <- data.mortality.child[data.mortality.child$location%in%c(0,5) ,]
 mean <- data.mean.child[data.mean.child$location%in%c(0,5) ,]
# WARNING: The following code will take a long time to run
## No test: 
 fit <- GPRMortalityChild(mortality,mean,minYear=1990,maxYear=2015,
     nu = 2,rho_ = 0.4 , n.itr=2000,n.warm=1000,verbose=TRUE)
 fit$simulation
 fit$variance
 fit_sum = GPRMortalitySummary(fit)
 fit_sum
## End(No test)




