library(ParetoPosStable)


### Name: se
### Title: Approximated standard errors of Pareto Positive Stable (PPS)
###   parameter estimates
### Aliases: print.se se se.default

### ** Examples

x <- rPPS(50, 1.2, 100, 2.3)
fit <- PPS.fit(x)
coef(fit)
se(fit, k = 50)



