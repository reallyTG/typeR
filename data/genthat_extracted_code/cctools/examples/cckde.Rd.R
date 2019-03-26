library(cctools)


### Name: cckde
### Title: Continuous convolution density estimator
### Aliases: cckde dcckde predict.cckde

### ** Examples

# dummy data with discrete variables
dat <- data.frame(
    F1 = factor(rbinom(10, 4, 0.1), 0:4),
    Z1 = ordered(rbinom(10, 5, 0.5), 0:5),
    Z2 = ordered(rpois(10, 1), 0:10),
    X1 = rnorm(10),
    X2 = rexp(10)
)

fit <- cckde(dat)  # fit estimator
dcckde(dat, fit)   # evaluate density
predict(fit, dat)  # equivalent




