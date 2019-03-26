library(stepR)


### Name: stepbound
### Title: Jump estimation under restrictions
### Aliases: stepbound stepbound.default stepbound.stepcand
### Keywords: nonparametric

### ** Examples

# simulate poisson data with two levels
y <- rpois(100, c(rep(1, 50), rep(4, 50)))
# compute bounds
b <- bounds(y, penalty="len", family="poisson", q=4)
# fit step function to bounds
sb <- stepbound(y, b, family="poisson", confband=TRUE)
plot(y)
lines(sb)
# plot confidence intervals for jumps on axis
points(jumpint(sb), col="blue")
# confidence band
lines(confband(sb), lty=2, col="blue")



