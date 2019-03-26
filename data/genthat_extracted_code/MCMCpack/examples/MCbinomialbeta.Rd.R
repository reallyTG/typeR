library(MCMCpack)


### Name: MCbinomialbeta
### Title: Monte Carlo Simulation from a Binomial Likelihood with a Beta
###   Prior
### Aliases: MCbinomialbeta
### Keywords: models

### ** Examples


## Not run: 
##D posterior <- MCbinomialbeta(3,12,mc=5000)
##D summary(posterior)
##D plot(posterior)
##D grid <- seq(0,1,0.01)
##D plot(grid, dbeta(grid, 1, 1), type="l", col="red", lwd=3, ylim=c(0,3.6),
##D   xlab="pi", ylab="density")
##D lines(density(posterior), col="blue", lwd=3)
##D legend(.75, 3.6, c("prior", "posterior"), lwd=3, col=c("red", "blue"))
## End(Not run)




