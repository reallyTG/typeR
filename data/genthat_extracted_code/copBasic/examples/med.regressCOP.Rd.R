library(copBasic)


### Name: med.regressCOP
### Title: Perform Median Regression using a Copula by Numerical Derivative
###   Method for V with respect to U
### Aliases: med.regressCOP
### Keywords: median regression quantile regression Normal copula Gaussian
###   copula API to the copula package package copula (comparison to)

### ** Examples

## Not run: 
##D # INDEPENDENCE YIELDS STRAIGHT LINES, RED IS THE MEDIAN REGRESSION
##D F <- seq(0.1, 0.9, by=0.1)
##D plot(c(0,1),c(0,1), type="n", lwd=3,
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D # Draw the regression of V on U and then U on V (wrtV=TRUE)
##D qua.regressCOP.draw(f=F, cop=P, para=NA, ploton=FALSE)
##D qua.regressCOP.draw(f=F, cop=P, para=NA, ploton=FALSE, wrtV=TRUE, lty=2)#
## End(Not run)

## Not run: 
##D # NEGATIVE PLACKETT THETA YIELDS CURVES DOWN TO RIGHT, RED IS THE MEDIAN REGRESSION
##D theta <- 0.5; F <- seq(0.1, 0.9, by=0.1)
##D plot(c(0,1),c(0,1), type="n", lwd=3,
##D      xlab="U, NONEXCEEDANCE PROBABILITY", ylab="V, NONEXCEEDANCE PROBABILITY")
##D # Draw the regression of V on U and then U on V (wrtV=TRUE)
##D qua.regressCOP.draw(f=F, cop=PLACKETTcop, ploton=FALSE, para=theta)
##D qua.regressCOP.draw(f=F, cop=PLACKETTcop, ploton=FALSE, para=theta, wrtV=TRUE, lty=2)#
## End(Not run)



