library(MCMCpack)


### Name: MCnormalnormal
### Title: Monte Carlo Simulation from a Normal Likelihood (with known
###   variance) with a Normal Prior
### Aliases: MCnormalnormal
### Keywords: models

### ** Examples


## Not run: 
##D y <- c(2.65, 1.80, 2.29, 2.11, 2.27, 2.61, 2.49, 0.96, 1.72, 2.40)
##D posterior <- MCMCpack:::MCnormalnormal(y, 1, 0, 1, 5000)
##D summary(posterior)
##D plot(posterior)
##D grid <- seq(-3,3,0.01)
##D plot(grid, dnorm(grid, 0, 1), type="l", col="red", lwd=3, ylim=c(0,1.4),
##D    xlab="mu", ylab="density")
##D lines(density(posterior), col="blue", lwd=3)
##D legend(-3, 1.4, c("prior", "posterior"), lwd=3, col=c("red", "blue"))
## End(Not run)




