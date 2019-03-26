library(EfficientMaxEigenpair)


### Name: ray.quot.seceig.general
### Title: Rayleigh quotient iteration
### Aliases: ray.quot.seceig.general

### ** Examples

Q = matrix(c(1, 1, 3, 2, 2, 2, 3, 1, 1), 3, 3)
ray.quot.seceig.general(Q, mu=rep(1,dim(Q)[1]), v0_tilde=rep(1,dim(Q)[1]), zstart=6,
 digit.thresh = 6)



