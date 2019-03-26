## ----core_pkgs, echo=FALSE-----------------------------------------------
library(tibble)

## ----load_pkg------------------------------------------------------------
library(survtmle)

## ----sim_data------------------------------------------------------------
set.seed(1234)
n <- 200
t_0 <- 6
trt <- rbinom(n, 1, 0.5)
adjustVars <- data.frame(W1 = round(runif(n)), W2 = round(runif(n, 0, 2)))
ftime <- round(1 + runif(n, 1, 4) - trt + adjustVars$W1 + adjustVars$W2)
ftype <- round(runif(n, 0, 1))

## ----view_data, echo=FALSE-----------------------------------------------
d <- as_data_frame(cbind(ftype, ftime, trt, adjustVars))
d

## ----example_glm_mean----------------------------------------------------
# Fit 1: Use GLM-based estimators for failure w/ "mean" method
fit1 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.ftime = "trt + W1 + W2",
                 method = "mean", t0 = t_0)
fit1

## ----example_glm_mean_2--------------------------------------------------
# Fit 2: Use GLM-based estimators for failure, treatment, and censoring with the
#        "mean" method
fit2 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ctime = "W1 + trt + t + I(t^2)",
                 glm.ftime = "trt + W1 + W2",
                 method = "mean", t0 = t_0)
fit2

## ----example_sl_mean-----------------------------------------------------
# Fit 3: SuperLearner estimators for treatment, failure, and censoring.
fit3 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 SL.trt = c("SL.glm","SL.mean","SL.step"),
                 SL.ftime = c("SL.glm","SL.mean","SL.step"),
                 SL.ctime = c("SL.glm","SL.mean","SL.step"),
                 method = "mean", t0 = t_0)
fit3

## ----example_glm_hazard--------------------------------------------------
# Fit 4: GLM estimators for treatment, censoring, and failure w/ "hazard" method
# Note the inclusion of 't' in the formula for glm.ftime.
fit4 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ftime = "trt + W1 + W2 + t + I(t^2)",
                 glm.ctime = "trt + W1 + W2*t",
                 method = "hazard", t0 = t_0)
fit4

## ----example_sl_hazard---------------------------------------------------
# Fit 5: SuperLearner estimators for failure and censoring, alongside empirical
#        estimators for treatment (the default) using the "hazard" method.
#        Note that the super learner for ftime is also adjusting for time.
fit5 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 SL.trt = c("SL.glm", "SL.mean", "SL.step"),
                 SL.ftime = c("SL.glm", "SL.mean", "SL.step"),
                 SL.ctime = c("SL.glm", "SL.mean", "SL.step"),
                 method = "hazard", t0 = t_0)
fit5

## ----simulate_mult_data--------------------------------------------------
set.seed(1234)
n <- 200
trt <- rbinom(n, 1, 0.5)
adjustVars <- data.frame(W1 = round(runif(n)), W2 = round(runif(n, 0, 2)))
ftime <- round(1 + runif(n, 1, 4) - trt + adjustVars$W1 + adjustVars$W2)
ftype <- round(runif(n, 0, 2))

## ----examine_mult_data, echo=FALSE---------------------------------------
dm <- tibble::as_tibble(cbind(ftype, ftime, trt, adjustVars))
dm

## ----example_glm_mean_multftypes-----------------------------------------
# Fit 6: GLM estimators for treatment, censoring, and failure w/ "mean" method
fit6 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ftime = "trt + W1 + W2",
                 glm.ctime = "trt + W1 + W2",
                 method = "mean", t0 = t_0)
fit6

## ----example_glm_mean_multftypes_ftypeOfInterest-------------------------
# Fit 7: GLM estimators for treatment, censoring, and failure w/ "mean" method
fit7 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ftime = "trt + W1 + W2",
                 glm.ctime = "trt + W1 + W2",
                 method = "mean", t0 = t_0,
                 ftypeOfInterest = 1)
fit7

## ----example_sl_mean_multftypes------------------------------------------
# Fit 8: SuperLearner estimators for failure and censoring and empirical
#        estimators for treatment (default) using the "mean" method.
fit8 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 SL.trt = c("SL.glm","SL.mean","SL.step"),
                 SL.ftime = c("SL.glm","SL.mean","SL.step"),
                 SL.ctime = c("SL.glm","SL.mean","SL.step"),
                 method = "mean", t0 = t_0)
fit8

## ----example_glm_hazard_multftypes---------------------------------------
# Fit 9: same as Fit 8 above, but using the "hazard" method
fit9 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ftime = "trt + W1 + W2",
                 glm.ctime = "trt + W1 + W2",
                 method = "hazard", t0 = t_0)
fit9

## ----example_sl_hazard_multftypes----------------------------------------
# Fit 10: same as Fit 7 above, but using the "hazard" method
fit10 <- survtmle(ftime = ftime, ftype = ftype,
                  trt = trt, adjustVars = adjustVars,
                  SL.trt = c("SL.glm","SL.mean","SL.step"),
                  SL.ftime = c("SL.glm","SL.mean","SL.step"),
                  SL.ctime = c("SL.glm","SL.mean","SL.step"),
                  method = "hazard", t0 = t_0)
fit10

## ----bounded_tmle--------------------------------------------------------
bf1 <- data.frame(t = seq_len(t_0), l1 = rep(0.01, t_0), u1 = rep(0.99, t_0))
bf1

## ----example_glm_mean_bounded--------------------------------------------
# Fit 11: Fit 2, but now specifying bounds on the iterated conditional means
fit11 <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ftime = "trt + W1 + W2",
                 glm.ctime = "trt + W1 + W2",
                 method = "mean", t0 = t_0,
                 bounds = bf1)
fit11

## ------------------------------------------------------------------------
# need to make a data.frame of bounds in proper format two types of failure that
# are labeled with ftype = 1 and ftype = 2, so bounds should have columns 't',
# 'l1', 'u1', 'l2', and 'u2'.
bf2 <- data.frame(t = seq_len(t_0),
                  l1 = rep(0.01, t_0), u1 = rep(0.99, t_0),
                  l2 = rep(0.02, t_0), u2 = rep(0.99, t_0)
                 )
bf2

## ------------------------------------------------------------------------
# Fit 12: same as Fit 5 above, but now include bounds
fit12 <- survtmle(ftime = ftime, ftype = ftype,
                  trt = trt, adjustVars = adjustVars,
                  glm.trt = "W1 + W2",
                  glm.ftime = "trt + W1 + W2",
                  glm.ctime = "trt + W1 + W2",
                  method = "mean", t0 = t_0,
                  bounds = bf2)
fit12

## ----sim_data_2----------------------------------------------------------
set.seed(1234)
n <- 200
t_0 <- 6
trt <- rbinom(n, 1, 0.5)
adjustVars <- data.frame(W1 = round(runif(n)), W2 = round(runif(n, 0, 2)))
ftime <- round(1 + runif(n, 1, 4) - trt + adjustVars$W1 + adjustVars$W2)
ftype <- round(runif(n, 0, 1))

## ----example_glm_mean_3--------------------------------------------------
# Refit fit 2 returning models
fit2_rm <- survtmle(ftime = ftime, ftype = ftype,
                 trt = trt, adjustVars = adjustVars,
                 glm.trt = "W1 + W2",
                 glm.ctime = "W1 + trt + t + I(t^2)",
                 glm.ftime = "trt + W1 + W2",
                 method = "mean", t0 = t_0,
                 returnModels = TRUE)
fit2_rm

## ------------------------------------------------------------------------
tp.fit2 <- timepoints(fit2_rm, times = seq_len(t_0))
# print the object
tp.fit2

## ------------------------------------------------------------------------
# Refit Fit 4, setting returnModels=TRUE this time...
fit4_rm <- survtmle(ftime = ftime, ftype = ftype,
                    trt = trt, adjustVars = adjustVars,
                    glm.trt = "W1 + W2",
                    glm.ftime = "trt + W1 + W2 + t + I(t^2)",
                    glm.ctime = "trt + W1 + W2*t",
                    method = "hazard", t0 = t_0,
                    returnModels = TRUE)
# call timepoints based on this fit
tp.fit4 <- timepoints(fit4_rm, times = seq_len(t_0))
# print the object
tp.fit4

## ------------------------------------------------------------------------
# plot raw cumulative incidence
plot(tp.fit4, type = "raw")

## ------------------------------------------------------------------------
# plot smoothed cumulative incidence
plot(tp.fit4)

## ----sessionInfo, echo=FALSE---------------------------------------------
sessionInfo()

