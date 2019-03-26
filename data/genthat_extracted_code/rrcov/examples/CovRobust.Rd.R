library(rrcov)


### Name: CovRobust
### Title: Robust Location and Scatter Estimation
### Aliases: CovRobust
### Keywords: robust multivariate

### ** Examples

data(hbk)
hbk.x <- data.matrix(hbk[, 1:3])
CovRobust(hbk.x)
CovRobust(hbk.x, CovControlSest(method="bisquare"))




