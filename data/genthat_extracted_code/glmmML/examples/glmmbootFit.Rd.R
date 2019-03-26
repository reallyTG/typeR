library(glmmML)


### Name: glmmbootFit
### Title: Generalized Linear Models with fixed effects grouping
### Aliases: glmmbootFit
### Keywords: regression nonlinear

### ** Examples

## Not run
x <- matrix(rnorm(1000), ncol = 1)
id <- rep(1:100, rep(10, 100))
y <- rbinom(1000, size = 1, prob = 0.4)
fit <- glmmbootFit(x, y, cluster = id, boot = 200)
summary(fit)
## End(Not run)
## Should show no effects. And boot too small.



