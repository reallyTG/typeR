library(ergm)


### Name: mcmc.diagnostics
### Title: Conduct MCMC diagnostics on a model fit
### Aliases: mcmc.diagnostics mcmc.diagnostics.default
###   mcmc.diagnostics.ergm
### Keywords: models

### ** Examples


## Not run: 
##D #
##D data(florentine)
##D #
##D # test the mcmc.diagnostics function
##D #
##D gest <- ergm(flomarriage ~ edges + kstar(2))
##D summary(gest)
##D 
##D #
##D # Plot the probabilities first
##D #
##D mcmc.diagnostics(gest)
##D #
##D # Use coda directly
##D #
##D library(coda)
##D #
##D plot(gest$sample, ask=FALSE)
##D #
##D # A full range of diagnostics is available 
##D # using codamenu()
##D #
## End(Not run)




