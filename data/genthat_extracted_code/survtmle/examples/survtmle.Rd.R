library(survtmle)


### Name: survtmle
### Title: Compute Targeted Minimum Loss-Based Estimators in Survival
###   Analysis Settings
### Aliases: survtmle

### ** Examples


# simulate data
set.seed(1234)
n <- 200
trt <- rbinom(n, 1, 0.5)
adjustVars <- data.frame(W1 = round(runif(n)), W2 = round(runif(n, 0, 2)))

ftime <- round(1 + runif(n, 1, 4) - trt + adjustVars$W1 + adjustVars$W2)
ftype <- round(runif(n, 0, 1))

# Fit 1
# fit a survtmle object with glm estimators for treatment, censoring, and
# failure using the "mean" method
fit1 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ftime = "trt + W1 + W2",
                 glm.ctime = "trt + W1 + W2",
                 method = "mean", t0 = 6)
fit1

# Fit 2
# fit an survtmle object with SuperLearner estimators for failure and
# censoring and empirical estimators for treatment using the "mean" method
fit2 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 SL.ftime = c("SL.mean"),
                 SL.ctime = c("SL.mean"),
                 method = "mean", t0 = 6)
fit2




