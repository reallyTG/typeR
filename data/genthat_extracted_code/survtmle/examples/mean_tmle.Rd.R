library(survtmle)


### Name: mean_tmle
### Title: TMLE for G-Computation of Cumulative Incidence
### Aliases: mean_tmle

### ** Examples


## Single failure type examples
# simulate data
set.seed(1234)
n <- 100
trt <- rbinom(n,1,0.5)
adjustVars <- data.frame(W1 = round(runif(n)), W2 = round(runif(n, 0, 2)))

ftime <- round(1 + runif(n, 1, 4) - trt + adjustVars$W1 + adjustVars$W2)
ftype <- round(runif(n, 0, 1))

# Fit 1 - fit mean_tmle object with GLMs for treatment, censoring, failure
fit1 <- mean_tmle(ftime = ftime, ftype = ftype,
                  trt = trt, adjustVars = adjustVars,
                  glm.trt = "W1 + W2",
                  glm.ftime = "trt + W1 + W2",
                  glm.ctime = "trt + W1 + W2")




