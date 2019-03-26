library(Compositional)


### Name: Estimation of the value of alpha via the profile log-likelihood
### Title: Estimation of the value of alpha via the alfa profile
###   log-likelihood
### Aliases: alfa.profile
### Keywords: \alpha -transformation profile log-likelihood

### ** Examples

x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
alfa.tune(x)
alfa.profile(x)



