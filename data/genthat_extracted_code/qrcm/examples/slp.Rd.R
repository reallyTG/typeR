library(qrcm)


### Name: slp
### Title: Shifted Legendre Polynomials
### Aliases: slp
### Keywords: smooth

### ** Examples

  p <- seq(0,1,0.1)
  slp(p, k = 1) # = 2*p
  slp(p, k = 1, intercept = TRUE) # = 2*p - 1 (this is the true SLP of order 1)
  slp(p, k = 3) # a linear combination of (p, p^2, p^3), with slp(0,k) = 0



