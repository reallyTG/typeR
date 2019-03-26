library(stepR)


### Name: stepfit
### Title: Fitted step function
### Aliases: [.stepfit stepfit print.stepfit plot.stepfit lines.stepfit
###   fitted.stepfit residuals.stepfit logLik.stepfit
### Keywords: nonparametric

### ** Examples

# simulate 5 blocks (4 jumps) within a total of 100 data points
b <- c(sort(sample(1:99, 4)), 100)
p <- rep(runif(5), c(b[1], diff(b))) # success probabilities
# binomial observations, each with 10 trials
y <- rbinom(100, 10, p)
# find solution with 5 blocks
fit <- steppath(y, family = "binomial", param = 10)[[5]]
plot(y, ylim = c(0, 10))
lines(fit, col = "red")
# residual diagnostics for Gaussian data
yg <- rnorm(100, qnorm(p), 1)
fitg <- steppath(yg)[[5]]
plot(yg, ylim = c(0, 10))
lines(fitg, col = "red")
plot(resid(fitg, yg))
qqnorm(resid(fitg, yg))



