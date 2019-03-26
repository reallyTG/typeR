library(MVT)


### Name: studentFit
### Title: Estimation of mean and covariance using the multivariate
###   t-distribution
### Aliases: studentFit
### Keywords: models multivariate

### ** Examples

data(PFM)
fit <- studentFit(~ cuprum.D + habitat.D + planvital.D + provida.D, data = PFM,
  family = Student(eta = 0.25))
fit



