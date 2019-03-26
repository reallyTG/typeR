library(gsDesign)


### Name: gsDensity
### Title: 2.6: Group sequential design interim density function
### Aliases: gsDensity
### Keywords: design

### ** Examples

# set up a group sequential design
x <- gsDesign()

# set theta values where density is to be evaluated
theta <- x$theta[2] * c(0, .5, 1, 1.5)

# set zi values from -1 to 7 where density is to be evaluated
zi <- seq(-3, 7, .05)

# compute subdensity values at analysis 2
y <- gsDensity(x, theta=theta, i=2, zi=zi)

# plot sub-density function for each theta value
plot(y$zi, y$density[,3], type="l", xlab="Z",
     ylab="Interim 2 density", lty=3, lwd=2)
lines(y$zi, y$density[,2], lty=2, lwd=2)
lines(y$zi, y$density[,1], lwd=2)
lines(y$zi, y$density[,4], lty=4, lwd=2)
title("Sub-density functions at interim analysis 2")
legend(x=c(3.85,7.2), y = c(.27,.385), lty=1:5, lwd=2, cex=1.5,
legend=c(
expression(paste(theta,"=0.0")),
expression(paste(theta,"=0.5", delta)),
expression(paste(theta,"=1.0", delta)),
expression(paste(theta,"=1.5", delta))))

# add vertical lines with lower and upper bounds at analysis 2
# to demonstrate how likely it is to continue, stop for futility
# or stop for efficacy at analysis 2 by treatment effect
lines(array(x$upper$bound[2],2), c(0,.4),col=2)
lines(array(x$lower$bound[2],2), c(0,.4), lty=2, col=2)

# Replicate part of figures 8.1 and 8.2 of Jennison and Turnbull text book
# O'Brien-Fleming design with four analyses

x <- gsDesign(k=4, test.type=2, sfu="OF", alpha=.1, beta=.2)

z <- seq(-4.2, 4.2, .05)
d <- gsDensity(x=x, theta=x$theta, i=4, zi=z)

plot(z, d$density[,1], type="l", lwd=2, ylab=expression(paste(p[4],"(z,",theta,")")))
lines(z, d$density[,2], lty=2, lwd=2)
u <- x$upper$bound[4]
text(expression(paste(theta,"=",delta)),x=2.2, y=.2, cex=1.5)
text(expression(paste(theta,"=0")),x=.55, y=.4, cex=1.5)



