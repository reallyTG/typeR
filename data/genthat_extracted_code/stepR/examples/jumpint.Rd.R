library(stepR)


### Name: jumpint
### Title: Confidence intervals for jumps and confidence bands for step
###   functions
### Aliases: jumpint jumpint.stepfit points.jumpint confband
###   confband.stepfit lines.confband
### Keywords: nonparametric

### ** Examples

# simulate Bernoulli data with four blocks
y <- rbinom(200, 1, rep(c(0.1, 0.7, 0.3, 0.9), each=50))
# fit step function
sb <- stepbound(y, family="binomial", param=1, confband=TRUE)
plot(y, pch="|")
lines(sb)
# confidence intervals for jumps
jumpint(sb)
points(jumpint(sb), col="blue")
# confidence band
confband(sb)
lines(confband(sb), lty=2, col="blue")



