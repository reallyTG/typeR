library(spatstat)


### Name: with.fv
### Title: Evaluate an Expression in a Function Table
### Aliases: with.fv
### Keywords: spatial manip programming

### ** Examples

  # compute 4 estimates of the K function
  X <- rpoispp(42)
  K <- Kest(X)
  plot(K)

  # derive 4 estimates of the L function L(r) = sqrt(K(r)/pi)
  L <- with(K, sqrt(./pi))
  plot(L)

  # compute 4 estimates of V(r) = L(r)/r
  V <- with(L, ./.x)
  plot(V)

  # compute the maximum absolute difference between
  # the isotropic and translation correction estimates of K(r)
  D <- with(K, max(abs(iso - trans)))



