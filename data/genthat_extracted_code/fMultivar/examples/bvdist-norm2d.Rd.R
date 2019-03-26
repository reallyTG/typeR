library(fMultivar)


### Name: bvdist-norm2d
### Title: Bivariate Normal Distribution
### Aliases: norm2d dnorm2d pnorm2d rnorm2d
### Keywords: math

### ** Examples

## dnorm2d -
   # Bivariate Normal Density:
   x <- (-40:40)/10
   X <- grid2d(x)
   z <- dnorm2d(X$x, X$y, rho = 0.5)
   ZD <- list(x = x, y = x, z = matrix(z, ncol = length(x)))
   # Perspective Density Plot:
   persp(ZD, theta = -40, phi = 30, col = "steelblue")
   # Contour Density Plot:
   contour(ZD, main="Bivariate Normal Density")
    
## pnorm2d -
   # Bivariate Normal Probability:
   z <- pnorm2d(X$x, X$y, rho = 0.5)
   ZP <- list(x = x, y = x, z = matrix(z, ncol = length(x)))
   # Perspective Plot:
   persp(ZP, theta = -40, phi = 30, col = "steelblue")
   # Contour Plot:
   contour(ZP)
   
## rnorm2d - 
   # Bivariate Normal Random Deviates
   r <- rnorm2d(5000, rho=0.5)
   # Scatter Plot:
   plot(r, col="steelblue", pch=19, cex=0.5) 
   contour(ZD, add=TRUE, lwd=2, col="red")
   # Hexagonal Binning:
   plot(hexBinning(r))
   contour(ZD, add=TRUE, lwd=2, col="black")



