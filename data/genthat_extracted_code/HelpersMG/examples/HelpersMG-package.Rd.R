library(HelpersMG)


### Name: HelpersMG-package
### Title: Tools for Earth Meteorological Analysis
### Aliases: HelpersMG-package

### ** Examples

## Not run: 
##D library(HelpersMG)
##D print('----------------------------------')
##D print('Examples for mcmcComposite objects')
##D print('----------------------------------')
##D require(coda)
##D x <- rnorm(30, 10, 2)
##D dnormx <- function(x, par) return(-sum(dnorm(x, mean=par['mean'], sd=par['sd'], log=TRUE)))
##D parameters_mcmc <- data.frame(Density=c('dnorm', 'dlnorm'), 
##D Prior1=c(10, 0.5), Prior2=c(2, 0.5), SDProp=c(0.35, 0.2), 
##D Min=c(-3, 0), Max=c(100, 10), Init=c(10, 2), stringsAsFactors = FALSE, 
##D row.names=c('mean', 'sd'))
##D mcmc_run <- MHalgoGen(n.iter=100000, parameters=parameters_mcmc, data=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=100, thin=1, trace=1)
##D plot(mcmc_run, xlim=c(0, 20))
##D plot(mcmc_run, xlim=c(0, 10), parameters="sd")
##D mcmcforcoda <- as.mcmc(mcmc_run)
##D # Optimal rejection rate should be 0.234
##D rejectionRate(mcmcforcoda)
##D heidel.diag(mcmcforcoda)
##D raftery.diag(mcmcforcoda)
##D autocorr.diag(mcmcforcoda)
##D acf(mcmcforcoda[[1]][,"mean"], lag.max=20, bty="n", las=1)
##D acf(mcmcforcoda[[1]][,"sd"], lag.max=20, bty="n", las=1)
##D batchSE(mcmcforcoda, batchSize=100)
##D # The batch standard error procedure is usually thought to 
##D # be not as accurate as the time series methods used in summary
##D summary(mcmcforcoda)$statistics[,"Time-series SE"]
##D summary(mcmc_run)
##D as.parameters(mcmc_run)
##D lastp <- as.parameters(mcmc_run, index="last")
##D parameters_mcmc[,"Init"] <- lastp
##D # The n.adapt set to 1 is used to not record the first set of parameters
##D # then it is not duplicated (as it is also the last one for 
##D # the object mcmc_run)
##D mcmc_run2 <- MHalgoGen(n.iter=10000, parameters=parameters_mcmc, data=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=1, thin=1, trace=1)
##D mcmc_run3 <- merge(mcmc_run, mcmc_run2)
##D ####### no adaptation, n.adapt must be 0
##D parameters_mcmc[,"Init"] <- c(mean(x), sd(x))
##D mcmc_run3 <- MHalgoGen(n.iter=10000, parameters=parameters_mcmc, data=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=0, thin=1, trace=1)
##D print('------------------------------------------')
##D print('Examples for Daily patterns of temperature')
##D print('------------------------------------------')
##D # Generate a timeserie of time
##D time.obs <- NULL
##D for (i in 0:9) time.obs <- c(time.obs, c(0, 6, 12, 18)+i*24)
##D # For these time, generate a timeseries of temperatures
##D temp.obs <- rep(NA, length(time.obs))
##D temp.obs[3+(0:9)*4] <- rnorm(10, 25, 3)
##D temp.obs[1+(0:9)*4] <- rnorm(10, 10, 3)
##D for (i in 1:(length(time.obs)-1)) 
##D   if (is.na(temp.obs[i])) 
##D   temp.obs[i] <- mean(c(temp.obs[i-1], temp.obs[i+1]))
##D   if (is.na(temp.obs[length(time.obs)])) 
##D   temp.obs[length(time.obs)] <- temp.obs[length(time.obs)-1]/2
##D observed <- data.frame(time=time.obs, temperature=temp.obs)
##D # Search for the minimum and maximum values
##D r <- minmax.periodic(time.minmax.daily=c(Min=2, Max=15), 
##D observed=observed, period=24)
##D 
##D # Estimate all the temperatures for these values
##D t <- temperature.periodic(minmax=r)
##D 
##D plot_errbar(x=t[,"time"], y=t[,"temperature"],
##D errbar.y=ifelse(is.na(t[,"sd"]), 0, 2*t[,"sd"]),
##D type="l", las=1, bty="n", errbar.y.polygon = TRUE, 
##D xlab="hours", ylab="Temperatures", ylim=c(0, 35), 
##D errbar.y.polygon.list = list(col="grey"))
##D 
##D plot_add(x=t[,"time"], y=t[,"temperature"], type="l")
## End(Not run)



