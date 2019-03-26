library(survtmle)


### Name: confint.survtmle
### Title: confint.survtmle
### Aliases: confint.survtmle

### ** Examples

# simulate data
set.seed(1234)
n <- 100
ftime <- round(runif(n, 1, 4))
ftype <- round(runif(n, 0, 2))
trt <- rbinom(n, 1, 0.5)
adjustVars <- data.frame(W1 = rnorm(n), W2 = rnorm(n))

# fit a survtmle object
fit <- survtmle(ftime = ftime, ftype = ftype, trt = trt,
                adjustVars = adjustVars, glm.trt = "W1 + W2",
                glm.ftime = "trt + W1 + W2", glm.ctime = "trt + W1 + W2",
                method = "mean", t0 = 4)
# get confidence intervals
ci <- confint(fit)
ci



