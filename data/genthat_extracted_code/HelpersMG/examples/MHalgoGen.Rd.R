library(HelpersMG)


### Name: MHalgoGen
### Title: Monte-Carlo Markov-chain with Metropolis-Hastings algorithm
### Aliases: MHalgoGen

### ** Examples

## Not run: 
##D library(HelpersMG)
##D require(coda)
##D val <- rnorm(30, 10, 2)
##D dnormx <- function(data, x) {
##D  data <- unlist(data)
##D  return(-sum(dnorm(data, mean=x['mean'], sd=x['sd'], log=TRUE)))
##D }
##D parameters_mcmc <- data.frame(Density=c('dnorm', 'dlnorm'), 
##D Prior1=c(10, 0.5), Prior2=c(2, 0.5), SDProp=c(0.35, 0.2), 
##D Min=c(-3, 0), Max=c(100, 10), Init=c(10, 2), stringsAsFactors = FALSE, 
##D row.names=c('mean', 'sd'))
##D mcmc_run <- MHalgoGen(n.iter=50000, parameters=parameters_mcmc, data=val, 
##D likelihood=dnormx, n.chains=1, n.adapt=100, thin=1, trace=1)
##D plot(mcmc_run, xlim=c(0, 20))
##D plot(mcmc_run, xlim=c(0, 10), parameters="sd")
##D library(graphics)
##D library(fields)
##D # show a scatter plot of the result
##D x <- mcmc_run$resultMCMC[[1]][, 1]
##D y <- mcmc_run$resultMCMC[[1]][, 2]
##D marpre <- par(mar=c(4, 4, 2, 6)+0.4)
##D smoothScatter(x, y)
##D # show a scale
##D n <- matrix(0, ncol=128, nrow=128)
##D xrange <- range(x)
##D yrange <- range(y)
##D for (i in 1:length(x)) {
##D   posx <- 1+floor(127*(x[i]-xrange[1])/(xrange[2]-xrange[1]))
##D   posy <- 1+floor(127*(y[i]-yrange[1])/(yrange[2]-yrange[1]))
##D   n[posx, posy] <- n[posx, posy]+1
##D }
##D image.plot(legend.only=TRUE, zlim= c(0, max(n)), nlevel=128, 
##D  col=colorRampPalette(c("white", blues9))(128))
##D # Compare with a heatmap
##D x <- seq(from=8, to=12, by=0.2)
##D y <- seq(from=1, to=4, by=0.2)
##D df <- expand.grid(mean=x, sd=y)
##D df <- cbind(df, L=rep(0, length(nrow(df))))
##D for (i in 1:nrow(df)) df[i, "L"] <- -sum(dnorm(val, df[i, 1], df[i, 2], log = TRUE))
##D hm <- matrix(df[, "L"], nrow=length(x))
##D par(mar = marpre)
##D image.plot(x=x, y=y, z=hm, las=1)
##D # Diagnostic function from coda library
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
##D mcmc_run2 <- MHalgoGen(n.iter=1000, parameters=parameters_mcmc, x=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=1, thin=1, trace=1)
##D mcmc_run3 <- merge(mcmc_run, mcmc_run2)
##D ####### no adaptation, n.adapt must be 0
##D parameters_mcmc[,"Init"] <- c(mean(x), sd(x))
##D mcmc_run3 <- MHalgoGen(n.iter=1000, parameters=parameters_mcmc, x=x, 
##D likelihood=dnormx, n.chains=1, n.adapt=0, thin=1, trace=1)
##D # Here is how to use adaptive mcmc
##D mcmc_run <- MHalgoGen(n.iter=50000, parameters=parameters_mcmc, data=val, adaptive = FALSE, 
##D likelihood=dnormx, n.chains=1, n.adapt=100, thin=1, trace=1)
##D 1-rejectionRate(as.mcmc(mcmc_run))
##D mcmc_run <- MHalgoGen(n.iter=50000, parameters=parameters_mcmc, data=val, adaptive = TRUE,  
##D likelihood=dnormx, n.chains=1, n.adapt=100, thin=1, trace=1)
##D 1-rejectionRate(as.mcmc(mcmc_run))
##D # To see the dynamics :
##D var <- "mean"
##D par(mar=c(4, 4, 1, 1)+0.4)
##D plot(1:nrow(mcmc_run$resultMCMC[[1]]), mcmc_run$resultMCMC[[1]][, var], type="l", 
##D        xlab="Iterations", ylab=var, bty="n", las=1)
## End(Not run)



