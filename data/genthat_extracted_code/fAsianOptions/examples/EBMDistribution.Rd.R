library(fAsianOptions)


### Name: EBMDistribution
### Title: Exponential Brownian Motion Distributions
### Aliases: EBMDistribution dlognorm plognorm dgam pgam drgam prgam
###   djohnson pjohnson mnorm mlognorm mrgam mjohnson masian derivative
###   dEBM pEBM d2EBM dasymEBM
### Keywords: math

### ** Examples

## dlognorm -
   # Calculate Log-Normal Density and its Derivaties:
   x = exp(seq(-2.8, 1.2, length = 100))
   y0 = dlognorm(x, deriv = 0)
   y1 = dlognorm(x, deriv = 1)
   y2 = dlognorm(x, deriv = 2) 
   
## derivative -
   # Compare with Numerical Differentiation:
   par(mfrow = c(2, 2))
   xa = exp(seq(-2.5, 1.5, length = 20))
   plot(x, y0, type = "l", main = "Log-Normal Density")
   plot(x, y1, type = "l", main = "1st Derivative")
   z = derivative(xa, dlognorm(xa, deriv = 0), deriv = 1)
   points(z$x, z$y, col = "steelblue")
   plot(x, y2, type = "l", main = "2nd Derivative")
   z = derivative(xa, dlognorm(xa, deriv = 0), deriv = 2)
   points(z$x, z$y, col = "steelblue")



