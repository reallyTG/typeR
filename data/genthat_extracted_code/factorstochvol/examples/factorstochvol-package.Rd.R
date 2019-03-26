library(factorstochvol)


### Name: factorstochvol-package
### Title: Bayesian Estimation of (Sparse) Latent Factor Stochastic
###   Volatility Models through MCMC
### Aliases: factorstochvol-package
### Keywords: models package ts

### ** Examples

## Not run: 
##D set.seed(1)
##D 
##D # simulate data from a (small) factor SV model:
##D sim <- fsvsim(series = 5, factors = 2)
##D 
##D # estimate the model (CAVEAT: only few draws!)
##D res <- fsvsample(sim$y, factors = 2, draws = 2000,
##D                  burnin = 500, runningstore = 6)
##D 
##D # plot implied volas overtime:
##D voltimeplot(res)
##D 
##D # plot correlation matrix at some points in time:
##D par(mfrow = c(2,2))
##D corimageplot(res, seq(1, nrow(sim$y), length.out = 4),
##D              fsvsimobj = sim, plotCI = 'circle',
##D              plotdatedist = -2)
##D 
##D 
##D # plot (certain) covariances and correlations over time
##D par(mfrow = c(2,1))
##D covtimeplot(res, 1)
##D cortimeplot(res, 1)
##D 
##D # plot (all) correlations over time
##D corplot(res, fsvsimobj = sim, these = 1:10)
##D 
##D # plot factor loadings
##D par(mfrow = c(1,1))
##D facloadpointplot(res, fsvsimobj = sim)
##D facloadpairplot(res)
##D facloadcredplot(res)
##D facloaddensplot(res, fsvsimobj = sim)
##D 
##D # plot latent log variances
##D logvartimeplot(res, fsvsimobj = sim, show = "fac")
##D logvartimeplot(res, fsvsimobj = sim, show = "idi")
##D 
##D # plot communalities over time
##D comtimeplot(res, fsvsimobj = sim, show = 'joint')
##D comtimeplot(res, fsvsimobj = sim, show = 'series')
## End(Not run)




