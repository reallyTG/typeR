library(MVT)


### Name: fisher.info
### Title: Fisher information matrix
### Aliases: fisher.info
### Keywords: multivariate

### ** Examples

data(PFM)
fit <- studentFit(~ cuprum.D + habitat.D + planvital.D + provida.D, data = PFM,
  family = Student(eta = 0.25))
info <- fisher.info(fit)



