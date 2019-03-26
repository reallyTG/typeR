library(ICcalib)


### Name: CalcCoxCalibRSIntsP
### Title: Calculating the probabilities of positive binary exposure status
###   at a given time point using proportional hazards grouped risk-set
###   calibration models
### Aliases: CalcCoxCalibRSIntsP

### ** Examples

set.seed(17)
sim.data <- ICcalib:::SimCoxIntervalCensCox(n.sample = 100, lambda = 0.1, 
                                            alpha = 0.25, beta0 = 0, 
                                            gamma.q = c(log(0.75), log(2.5)), 
                                            gamma.z = log(1.5), mu = 0.2, 
                                            n.points = 2)
# The baseline hazard for the calibration model is calculated in observation times
cox.hz.times <- sort(unique(sim.data$obs.tm)) 
# Fit proprtional hazards calibration model
fit.cox.rs.ints <- FitCalibCoxRSInts(w = sim.data$w, w.res = sim.data$w.res, 
                                     Q = sim.data$Q, hz.times = cox.hz.times, 
                                     n.int = 5, order = 2, pts.for.ints = seq(0,4,1), 
                                     tm = sim.data$obs.tm, event = sim.data$delta)
# Calculate the conditional probabilities of binary covariate=1 at time one
probs <- CalcCoxCalibRSIntsP(w = sim.data$w, w.res = sim.data$w.res, point = 1,
                             fit.cox.rs.ints = fit.cox.rs.ints,
                             pts.for.ints = seq(0,4,1), Q = sim.data$Q, 
                             hz.times = cox.hz.times)
summary(probs)



