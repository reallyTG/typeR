library(kdevine)


### Name: kde1d
### Title: Univariate kernel density estimation for bounded and unbounded
###   support
### Aliases: kde1d

### ** Examples

data(wdbc, package = "kdecopula")  # load data
fit <- kde1d(wdbc[, 5])            # estimate density
dkde1d(1000, fit)                  # evaluate density estimate




