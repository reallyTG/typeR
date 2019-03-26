library(dirmult)


### Name: estProfLogLik
### Title: Profile log-likelihood of Dirichlet-multinomial model
### Aliases: estProfLogLik

### ** Examples

data(us)
fit <- dirmult(us[[1]],epsilon=10^(-12),trace=FALSE)
estProfLogLik(us[[1]],fit$theta*1.2,epsilon=10^(-12),trace=FALSE)



