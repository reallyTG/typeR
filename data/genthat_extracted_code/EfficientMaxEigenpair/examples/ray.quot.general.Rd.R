library(EfficientMaxEigenpair)


### Name: ray.quot.general
### Title: Rayleigh quotient iteration
### Aliases: ray.quot.general

### ** Examples

A = matrix(c(1, 1, 3, 2, 2, 2, 3, 1, 1), 3, 3)
ray.quot.general(A, mu=rep(1,dim(A)[1]), v0_tilde=rep(1,dim(A)[1]), zstart=6,
 digit.thresh = 6)



