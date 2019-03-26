library(ICcalib)


### Name: CalcWeibullCalibP
### Title: Calculating the probabilities of positive binary exposure status
###   at a given time point using a Weibull calibration model
### Aliases: CalcWeibullCalibP

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
# Fit a Weibull calibration model for the covariate starting time distribution
calib.weib.params <- FitCalibWeibull(w = sim.data$w, w.res = sim.data$w.res)
# Calculate the conditional probabilities of binary covariate=1 at time one
probs <- CalcWeibullCalibP(w = sim.data$w, w.res = sim.data$w.res, point = 1,
                           weib.params = calib.weib.params)
summary(probs)



