library(extRemes)


### Name: make.qcov
### Title: Covariate Matrix for Non-Stationary EVD Projections
### Aliases: make.qcov is.qcov
### Keywords: array misc

### ** Examples

data(PORTw)
fit <- fevd(TMX1, PORTw, location.fun=~AOindex, units="deg C")
fit

v <- cbind(rep(1,4), c(1, -1, 1, -1), rep(1,4), rep(1,4))
v <- make.qcov(fit, vals=v, nr=4)
v

# cf.
v <- make.qcov(fit, vals=list(mu1=c(1, -1, 1, -1)))
v

# Or
v <- make.qcov(fit, vals=c(rep(1,4), c(1, -1, 1, -1), rep(1,8), rep(0,4)), nr=4)
v




