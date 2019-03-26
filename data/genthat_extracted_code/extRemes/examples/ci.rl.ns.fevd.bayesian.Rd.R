library(extRemes)


### Name: ci.rl.ns.fevd.bayesian
### Title: Confidence/Credible Intervals for Effective Return Levels
### Aliases: ci.rl.ns.fevd.bayesian ci.rl.ns.fevd.mle
### Keywords: htest

### ** Examples

data(Fort)
fit <- fevd(Prec, threshold = 2, data = Fort,
    location.fun = ~cos(2 * pi * day /365.25),
    type = "PP", verbose = TRUE)

v <- make.qcov(fit, vals=list(mu1 = c(cos(2 * pi * 1 /365.25),
    cos(2 * pi * 120 /365.25), cos(2 * pi * 360 /365.25))))

ci(fit, return.period = 100, qcov = v)

## Not run: 
##D fit <- fevd(Prec, threshold = 2, data = Fort,
##D     location.fun = ~cos(2 * day /365.25),
##D     type = "PP", method = "Bayesian", verbose = TRUE)
##D 
##D ci(fit, return.period = 100, qcov = v)
## End(Not run)



