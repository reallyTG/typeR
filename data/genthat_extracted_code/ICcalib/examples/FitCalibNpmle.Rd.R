library(ICcalib)


### Name: FitCalibNpmle
### Title: Fitting Nonparametric Calibration Models
### Aliases: FitCalibNpmle

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
# Calcualte the NPMLE for a nonparametric calibration model for the covariate 
# starting-time distribution
npmle.fit <- ICcalib::FitCalibNpmle(w = sim.data$w, w.res = sim.data$w.res)
# Plot the estimated survival function
plot(npmle.fit)



