library(aRpsDCA)


### Name: aRpsDCA-package
### Title: Arps Decline Curve Analysis in R
### Aliases: aRpsDCA-package aRpsDCA
### Keywords: package

### ** Examples

## Plot semi-log rate-time and Cartesian rate-cumulative
## for a hyperbolic-to-exponential decline
t <- seq(0, 10, 0.5)
q <- hyp2exp.q(5000, as.nominal(0.90), 1.5, as.nominal(0.10), t)
Np <- hyp2exp.Np(5000, as.nominal(0.90), 1.5, as.nominal(0.10), t)

old.par <- par(ask=TRUE)
plot(log(q) ~ t)
plot(q ~ Np)
par(old.par)



