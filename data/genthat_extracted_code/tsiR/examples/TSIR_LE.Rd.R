library(tsiR)


### Name: TSIR_LE
### Title: TSIR_LE
### Aliases: TSIR_LE

### ** Examples


## Not run: 
##D require(kernlab)
##D require(ggplot2)
##D require(kernlab)
##D London <- twentymeas$London
##D ## just analyze the biennial portion of the data
##D London <- subset(London, time > 1950)
##D 
##D ## define the interval to be 2 weeks
##D IP <- 2
##D 
##D ## first estimate paramters from the London data
##D parms <- estpars(data=London, IP=2, regtype='gaussian',family='poisson',link='log')
##D 
##D ## look at beta and alpha estimate
##D plotbeta(parms)
##D 
##D ## simulate the fitted parameters
##D sim <- simulatetsir(data=London,parms=parms,IP=2,method='deterministic',nsim=2)
##D 
##D ## now lets predict forward 200 years using the mean birth rate,
##D ## starting from rough initial conditions
##D times <- seq(1965,2165, by = 1/ (52/IP))
##D births <- rep(mean(London$births),length(times))
##D S0 <- parms$sbar
##D I0 <- 1e-5*mean(London$pop)
##D 
##D pred <- predicttsir(times=times,births=births,
##D                    beta=parms$contact$beta,alpha=parms$alpha,
##D                   S0=S0,I0=I0,
##D                   nsim=50,stochastic=T)
##D 
##D ## take the last 10 years
##D pred <- lapply(pred, function(x)  tail(x, 52/IP * 20) )
##D 
##D ## now compute the Lyapunov Exponent for the simulate and predicted model
##D 
##D simLE <- TSIR_LE(
##D time=sim$res$time,
##D S=sim$simS$mean,
##D I=sim$res$mean,
##D alpha=sim$alpha,
##D   beta=sim$contact$beta,
##D IP=IP
##D )
##D 
##D predLE <- TSIR_LE(
##D time=pred$I$time,
##D S=pred$S$X3,
##D I=pred$I$X3,
##D alpha=parms$alpha,
##D beta=parms$contact$beta,
##D IP=IP
##D )
##D 
##D simLE$LE
##D predLE$LE
##D 
##D 
## End(Not run)



