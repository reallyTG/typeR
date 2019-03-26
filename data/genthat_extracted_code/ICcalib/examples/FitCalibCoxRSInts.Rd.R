library(ICcalib)


### Name: FitCalibCoxRS
### Title: Fitting Proportional Hazards Risk-Set Calibration Models with
###   Covariates
### Aliases: FitCalibCoxRS FitCalibCoxRSInts

### ** Examples

set.seed(2) 
sim.data <- ICcalib:::SimCoxIntervalCensCox(n.sample = 50, lambda = 0.1, 
                                            alpha = 0.25, beta0 = log(0.2),
                                            gamma.q = c(log(0.75), log(2.5)), 
                                            gamma.z = log(1.5), mu = 0.2, 
                                            n.points = 2)
# The baseline hazard for the calibration model is calculated in observation times
cox.hz.times <- sort(unique(sim.data$obs.tm)) 
# Fit proprtional hazards grouped risk-sets calibration models
calib.ph.rs.fit <- FitCalibCoxRSInts(w = sim.data$w, w.res = sim.data$w.res, Q = sim.data$Q, 
                                     hz.times = cox.hz.times, tm = sim.data$obs.tm, 
                                     event = sim.data$delta, pts.for.ints = seq(0, 3, 1.5),
                                     n.int = 5, order = 2)
# Below is a more time consuming option (no grouping of risk-sets)
# FitCalibCoxRS(w = sim.data$w, w.res = sim.data$w.res, Q = sim.data$Q, 
#                hz.times = cox.hz.times, obs.tm = sim.data$obs.tm, 
#               event = sim.data$delta, n.int = 5, order = 1)



