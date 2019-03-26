library(fBasics)


### Name: linearInterp
### Title: Bivariate Linear Interpolation
### Aliases: linearInterp linearInterpp
### Keywords: programming

### ** Examples
 
## linearInterp -
   # Linear Interpolation:    
   if (require(akima)) {
     set.seed(1953)
     x = runif(999) - 0.5
     y = runif(999) - 0.5
     z = cos(2*pi*(x^2+y^2))
     ans = linearInterp(x, y, z, gridPoints = 41)
     persp(ans, theta = -40, phi = 30, col = "steelblue",
        xlab = "x", ylab = "y", zlab = "z")
     contour(ans)
   }



