library(SpatioTemporal)


### Name: MCMC.mesa.model
### Title: Example of a 'mcmcSTmodel' structure
### Aliases: MCMC.mesa.model
### Keywords: datasets

### ** Examples

##load data
data(mesa.model)
##and results of estimation
data(est.mesa.model)

##strating point
x <- coef(est.mesa.model)
##Hessian, for use as proposal matrix
H <- est.mesa.model$res.best$hessian.all
## Not run: 
##D   ##run MCMC
##D   MCMC.mesa.model <- MCMC(mesa.model, x$par, N = 2500, Hessian.prop = H)
## End(Not run)
##lets load precomputed results instead
data(MCMC.mesa.model)

##Examine the results
print(MCMC.mesa.model)

##and contens of result vector
names(MCMC.mesa.model)
 
##Summary
summary(MCMC.mesa.model)

##MCMC tracks for four of the parameters
par(mfrow=c(5,1),mar=c(2,2,2.5,.5))
plot(MCMC.mesa.model, ylab="", xlab="", type="l")
for(i in c(4,9,13,15)){
  plot(MCMC.mesa.model, i, ylab="", xlab="", type="l")
}



