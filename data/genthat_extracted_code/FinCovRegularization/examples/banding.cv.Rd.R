library(FinCovRegularization)


### Name: banding.cv
### Title: Select Tuning Parameter for Banding Covariance Matrix by CV
### Aliases: banding.cv

### ** Examples

data(m.excess.c10sp9003)
retcov.cv <- banding.cv(m.excess.c10sp9003, n.cv = 10,
                        norm = "F", seed = 142857)
summary(retcov.cv)
plot(retcov.cv)
# Low dimension



