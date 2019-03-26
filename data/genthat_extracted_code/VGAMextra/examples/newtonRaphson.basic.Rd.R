library(VGAMextra)


### Name: newtonRaphson.basic
### Title: Newton-Raphson algorithm
### Aliases: newtonRaphson.basic

### ** Examples

# Find the roots in c(-0.5, 0.8), c(0.6, 1.2) and c(1.3, 4.1) for the
# f(x) = x * (x - 1) * (x - 2). Roots: r1 = 0, and r2 = 1, r3 = 2.

f <- function(x) x * (x - 1) * (x - 2)
fprime <- function(x) 3 * x^2 - 6 * x + 2

# Three roots.
newtonRaphson.basic(f = f, fprime  = fprime, 
                    a = c(-0.5, 0.6, 1.3), 
                    b = c(0.8, 1.2, 4.1))              ## 0.0, 1.0 and 2.0
                    
# Recycling rule. Intervals analysed are (-0.5, 1.2) and (0.6, 1.2)
newtonRaphson.basic(f = f, fprime  = fprime, 
                    a = c(-0.5, 0.6), b = c(1.2)) 

## Warning: There is more than one root in (-0.5, 1.2)!



