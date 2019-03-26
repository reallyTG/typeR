library(tsiR)


### Name: predicttsir
### Title: predicttsir
### Aliases: predicttsir

### ** Examples

## Not run: 
##D require(kernlab)
##D require(ggplot2)
##D require(kernlab)
##D require(tsiR)
##D London <- twentymeas$London
##D 
##D London <- subset(London, time > 1950)
##D 
##D IP <- 2
##D ## first estimate paramters from the London data
##D parms <- estpars(data=London, IP=2, regtype='gaussian')
##D 
##D plotbeta(parms)
##D 
##D ## now lets predict forward 20 years using the mean birth rate,
##D ## starting from rough initial conditions
##D births <- min(London$births)
##D times <- seq(1965,1985, by = 1/ (52/IP))
##D S0 <- parms$sbar
##D I0 <- 1e-5*mean(London$pop)
##D 
##D pred <- predicttsir(times=times,births=births,
##D                     beta=parms$contact$beta,alpha=parms$alpha,
##D                     S0=S0,I0=I0,
##D                     nsim=50,stochastic=T)
##D 
##D ## plot this prediction
##D ggplot(pred$I,aes(time,mean))+geom_line()+geom_ribbon(aes(ymin=low,ymax=high),alpha=0.3)
##D 
##D 
## End(Not run)



