library(MCMCpack)


### Name: MCpoissongamma
### Title: Monte Carlo Simulation from a Poisson Likelihood with a Gamma
###   Prior
### Aliases: MCpoissongamma
### Keywords: models

### ** Examples


## Not run: 
##D data(quine)
##D posterior <- MCpoissongamma(quine$Days, 15, 1, 5000)
##D summary(posterior)
##D plot(posterior)
##D grid <- seq(14,18,0.01)
##D plot(grid, dgamma(grid, 15, 1), type="l", col="red", lwd=3, ylim=c(0,1.3),
##D   xlab="lambda", ylab="density")
##D lines(density(posterior), col="blue", lwd=3)
##D legend(17, 1.3, c("prior", "posterior"), lwd=3, col=c("red", "blue"))
## End(Not run)




