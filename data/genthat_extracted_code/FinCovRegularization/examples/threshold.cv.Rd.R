library(FinCovRegularization)


### Name: threshold.cv
### Title: Select Tuning Parameter for Thresholding Covariance Matrix by CV
### Aliases: threshold.cv

### ** Examples

data(m.excess.c10sp9003)
retcov.cv <- threshold.cv(m.excess.c10sp9003, method = "hard",
                          thresh.len = 20, n.cv = 10, norm = "F", seed = 142857)
summary(retcov.cv)
plot(retcov.cv)
# Low dimension



