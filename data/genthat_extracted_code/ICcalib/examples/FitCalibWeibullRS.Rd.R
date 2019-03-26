library(ICcalib)


### Name: FitCalibWeibullRS
### Title: Fitting Weibull Risk-Set Calibration Models
### Aliases: FitCalibWeibullRS

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
# Fit Weibull risk-set calibration models for the conditional covariate 
# starting-time distributions
ICcalib::FitCalibWeibullRS(w = sim.data$w, w.res = sim.data$w.res, 
                           tm = sim.data$obs.tm, event = sim.data$delta)



