library(HelpersMG)


### Name: summary.mcmcComposite
### Title: Summarize the result of a mcmcComposite object
### Aliases: summary.mcmcComposite

### ** Examples

## Not run: 
##D library(HelpersMG)
##D require(coda)
##D x <- rnorm(30, 10, 2)
##D dnormx <- function(data, x) {
##D  data <- unlist(data)
##D  return(-sum(dnorm(data, mean=x['mean'], sd=x['sd'], log=TRUE)))
##D }
##D parameters_mcmc <- data.frame(Density=c('dnorm', 'dlnorm'), 
##D Prior1=c(10, 0.5), Prior2=c(2, 0.5), SDProp=c(1, 1), 
##D Min=c(-3, 0), Max=c(100, 10), Init=c(10, 2), stringsAsFactors = FALSE, 
##D row.names=c('mean', 'sd'))
##D mcmc_run <- MHalgoGen(n.iter=1000, parameters=parameters_mcmc, data=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=100, thin=1, trace=1)
##D plot(mcmc_run, xlim=c(0, 20))
##D plot(mcmc_run, xlim=c(0, 10), parameters="sd")
##D mcmcforcoda <- as.mcmc(mcmc_run)
##D #' heidel.diag(mcmcforcoda)
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
##D mcmc_run2 <- MHalgoGen(n.iter=1000, parameters=parameters_mcmc, data=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=1, thin=1, trace=1)
##D mcmc_run3 <- merge(mcmc_run, mcmc_run2)
##D ####### no adaptation, n.adapt must be 0
##D parameters_mcmc[,"Init"] <- c(mean(x), sd(x))
##D mcmc_run3 <- MHalgoGen(n.iter=1000, parameters=parameters_mcmc, data=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=0, thin=1, trace=1)
## End(Not run)



