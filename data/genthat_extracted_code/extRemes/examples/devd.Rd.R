library(extRemes)


### Name: devd
### Title: Extreme Value Distributions
### Aliases: devd pevd qevd revd
### Keywords: distribution datagen

### ** Examples

## GEV df (Frechet type)
devd(2:4, 1, 0.5, 0.8) # pdf
pevd(2:4, 1, 0.5, 0.8) # cdf 
qevd(seq(1e-8,1-1e-8,,20), 1, 0.5, 0.8) # quantiles
revd(10, 1, 0.5, 0.8) # random draws

## GP df
devd(2:4, scale=0.5, shape=0.8, threshold=1, type="GP")
pevd(2:4, scale=0.5, shape=0.8, threshold=1, type="GP")
qevd(seq(1e-8,1-1e-8,,20), scale=0.5, shape=0.8, threshold=1, type="GP")
revd(10, scale=0.5, shape=0.8, threshold=1, type="GP")

## Not run: 
##D # The fickleness of extremes.
##D z1 <- revd(100, 1, 0.5, 0.8)
##D hist(z1, breaks="FD", freq=FALSE, xlab="GEV distributed random variables", col="darkblue")
##D lines(seq(0,max(z1),,200), devd(seq(0,max(z1),,200), 1, 0.5, 0.8), lwd=1.5, col="yellow")
##D lines(seq(0,max(z1),,200), devd(seq(0,max(z1),,200), 1, 0.5, 0.8), lwd=1.5, lty=2) 
##D 
##D z2 <- revd(100, 1, 0.5, 0.8)
##D qqplot(z1, z2)
##D 
##D z3 <- revd(100, scale=0.5, shape=0.8, threshold=1, type="GP")
##D # Or, equivalently
##D z4 <- revd(100, 5, 0.5, 0.8, 1, type="GP") # the "5" is ignored.
##D qqplot(z3, z4)
##D 
##D # Just for fun.
##D qqplot(z1, z3)
##D 
##D # Compare
##D par(mfrow=c(2,2))
##D plot(density(z1), xlim=c(0,100), ylim=c(0,1))
##D plot(density(z2), xlim=c(0,100), ylim=c(0,1))
##D plot(density(z3), xlim=c(0,100), ylim=c(0,1))
##D plot(density(z4), xlim=c(0,100), ylim=c(0,1))
##D 
##D # Three types
##D x <- seq(0,10,,200)
##D par(mfrow=c(1,2))
##D plot(x, devd(x, 1, 1, -0.5), type="l", col="blue", lwd=1.5,
##D     ylab="GEV df")
##D # Note upper bound at 1 - 1/(-0.5) = 3 in above plot.
##D 
##D lines(x, devd(x, 1, 1, 0), col="lightblue", lwd=1.5)
##D lines(x, devd(x, 1, 1, 0.5), col="darkblue", lwd=1.5)
##D legend("topright", legend=c("(reverse) Weibull", "Gumbel", "Frechet"),
##D     col=c("blue", "lightblue", "darkblue"), bty="n", lty=1, lwd=1.5)
##D 
##D plot(x, devd(x, 1, 1, -0.5, 1, type="GP"), type="l", col="blue", lwd=1.5,
##D     ylab="GP df")
##D lines(x, devd(x, 1, 1, 0, 1, type="GP"), col="lightblue", lwd=1.5)
##D lines(x, devd(x, 1, 1, 0.5, 1, type="GP"), col="darkblue", lwd=1.5)
##D legend("topright", legend=c("Beta", "Exponential", "Pareto"), 
##D     col=c("blue", "lightblue", "darkblue"), bty="n", lty=1, lwd=1.5)
##D 
##D # Emphasize the tail differences more by using different scale parameters.
##D par(mfrow=c(1,2))
##D plot(x, devd(x, 1, 0.5, -0.5), type="l", col="blue", lwd=1.5,
##D     ylab="GEV df")
##D lines(x, devd(x, 1, 1, 0), col="lightblue", lwd=1.5)
##D lines(x, devd(x, 1, 2, 0.5), col="darkblue", lwd=1.5)
##D legend("topright", legend=c("(reverse) Weibull", "Gumbel", "Frechet"), 
##D     col=c("blue", "lightblue", "darkblue"), bty="n", lty=1, lwd=1.5)
##D 
##D plot(x, devd(x, 1, 0.5, -0.5, 1, type="GP"), type="l", col="blue", lwd=1.5,
##D     ylab="GP df")
##D lines(x, devd(x, 1, 1, 0, 1, type="GP"), col="lightblue", lwd=1.5)
##D lines(x, devd(x, 1, 2, 0.5, 1, type="GP"), col="darkblue", lwd=1.5)
##D legend("topright", legend=c("Beta", "Exponential", "Pareto"),
##D     col=c("blue", "lightblue", "darkblue"), bty="n", lty=1, lwd=1.5)
##D 
## End(Not run)



