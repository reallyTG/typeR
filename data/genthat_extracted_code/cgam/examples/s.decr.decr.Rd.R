library(cgam)


### Name: s.decr.decr
### Title: Specify a Doubly-Decreasing Shape-Restriction in a CGAM Formula
### Aliases: s.decr.decr
### Keywords: shape routine

### ** Examples

  # generate data
  n <- 100
  set.seed(123)
  x1 <- runif(n)
  x2 <- runif(n)
  y <- -4 * (x1 + x2 - x1 * x2) + rnorm(n, sd = .2)

  # regress y on x1 and x2 under the shape-restriction: "doubly-decreasing" 
  # using the penalized estimator
  ans <- cgam(y ~ s.decr.decr(x1, x2), pnt = TRUE)

  # make a 3D plot of the constrained surface
  plotpersp(ans)



