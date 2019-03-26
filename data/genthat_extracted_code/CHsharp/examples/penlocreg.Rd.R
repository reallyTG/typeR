library(CHsharp)


### Name: penlocreg
### Title: Penalized Local Polynomial Regression
### Aliases: penlocreg
### Keywords: models

### ** Examples
 
xx <- faithful$waiting 
yy <- faithful$eruptions 
h <- dpill(xx,yy)/2; lam <- 20  # tuning parameter selections 
yy.pen <- penlocreg(xx, yy, seq(min(xx), max(xx), len=401), lambda=lam, degree=1, h = h, L = 
    SecondDerivativePenalty) 
plot(xx, yy, xlab="waiting", ylab="eruptions", col="grey") 
title("Old Faithful")
points(yy.pen, col=2, cex=.6) # sharpened data points
lines(locpoly(xx, yy, bandwidth=h*2, degree=1), lwd=2) # local linear estimate
lines(locpoly(yy.pen$x, yy.pen$y, bandwidth=h, degree=1), col=2, lwd=2) # sharpened estimate 



