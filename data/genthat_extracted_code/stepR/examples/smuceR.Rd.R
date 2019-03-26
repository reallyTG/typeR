library(stepR)


### Name: smuceR
### Title: Piecewise constant regression with SMUCE
### Aliases: smuceR thresh.smuceR
### Keywords: nonparametric

### ** Examples

y <- rnorm(100, c(rep(0, 50), rep(1, 50)), 0.5)

# fitted function, confidence intervals, and confidence band by stepFit
all.equal(fitted(smuceR(y, q = 1)), fitted(stepFit(y, q = 1)))
all.equal(fitted(smuceR(y, alpha = 0.5)),
          fitted(stepFit(y, q = as.numeric(quantile(stepR::MRC.1000, 0.5)))))
all.equal(fitted(smuceR(y)), fitted(stepFit(y, q = thresh.smuceR(length(y)))))

all.equal(jumpint(smuceR(y, q = 1, jumpint = TRUE)),
          jumpint(stepFit(y, q = 1, jumpint = TRUE)))
all.equal(confband(smuceR(y, q = 1, confband = TRUE)),
          confband(stepFit(y, q = 1, confband = TRUE)),
          check.attributes = FALSE)
          

# simulate poisson data with two levels
y <- rpois(100, c(rep(1, 50), rep(4, 50)))
# compute fit, q is chosen automatically
fit <- smuceR(y, family="poisson", confband = TRUE)
# plot result
plot(y)
lines(fit)
# plot confidence intervals for jumps on axis
points(jumpint(fit), col="blue")
# confidence band
lines(confband(fit), lty=2, col="blue")

# simulate binomial data with two levels
y <- rbinom(200,3,rep(c(0.1,0.7),c(110,90)))
# compute fit, q is the 0.9-quantile of the (asymptotic) null distribution
fit <- smuceR(y, alpha=0.1, family="binomial", param=3, confband = TRUE)
# plot result
plot(y)
lines(fit)
# plot confidence intervals for jumps on axis
points(jumpint(fit), col="blue")
# confidence band
lines(confband(fit), lty=2, col="blue")



