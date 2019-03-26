library(FinCovRegularization)


### Name: tapering.cv
### Title: Select Tuning Parameter for Tapering Covariance Matrix by CV
### Aliases: tapering.cv

### ** Examples

data(m.excess.c10sp9003)
retcov.cv <- tapering.cv(m.excess.c10sp9003, n.cv = 10,
                         norm = "F", seed = 142857)
summary(retcov.cv)
plot(retcov.cv)
# Low dimension



