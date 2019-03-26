library(stochvol)


### Name: svsample
### Title: Markov Chain Monte Carlo (MCMC) Sampling for the Stochastic
###   Volatility (SV) Model
### Aliases: svsample
### Keywords: models ts

### ** Examples

## Simulate a short and highly persistent SV process 
sim <- svsim(100, mu = -10, phi = 0.99, sigma = 0.2)

## Obtain 5000 draws from the sampler (that's not a lot)
draws <- svsample(sim$y, draws = 5000, burnin = 100,
		  priormu = c(-10, 1), priorphi = c(20, 1.5), priorsigma = 0.2)

## Check out the results
summary(draws)
plot(draws)


## Another example, this time with an AR(1) structure for the mean
## Not run: 
##D data(exrates)
##D y <- exrates$USD
##D 
##D ## Fit AR(1)-SV model to EUR-USD exchange rates
##D res <- svsample(y, designmatrix = "ar1")
##D 
##D ## Use predict.svdraws to obtain predictive volatilities
##D ahead <- 100
##D predvol <- predict(res, steps = ahead)
##D 
##D ## Use arpredict to obtain draws from the posterior predictive
##D preddraws <- arpredict(res, predvol)
##D 
##D ## Calculate predictive quantiles
##D predquants <- apply(preddraws, 2, quantile, c(.1, .5, .9))
##D 
##D ## Visualize
##D ts.plot(y, xlim = c(length(y) - ahead, length(y) + ahead),
##D 	ylim = range(predquants))
##D for (i in 1:3) {
##D  lines((length(y) + 1):(length(y) + ahead), predquants[i,],
##D        col = 3, lty = c(2, 1, 2)[i])
##D }
## End(Not run)



