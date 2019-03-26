library(ICcalib)


### Name: FitCalibWeibull
### Title: Fitting Weibull Calibration Models
### Aliases: FitCalibWeibull

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
# Fit a Weibull calibration model for the covariate starting time distribution
ICcalib::FitCalibWeibull(w = sim.data$w, w.res = sim.data$w.res) 



