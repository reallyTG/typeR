library(ICcalib)


### Name: CalcWeibullRSP
### Title: Calculating the probabilities of positive binary exposure status
###   at a given time point using risk-set Weibull calibration models
### Aliases: CalcWeibullRSP

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
case.times <- sim.data$obs.tm[sim.data$delta==1]
# Fit Weibull risk-set calibration models
calib.weib.params <- FitCalibWeibullRS(w = sim.data$w, w.res = sim.data$w.res, 
                                       tm = sim.data$obs.tm, 
                                       event = sim.data$delta)
# Calculate the conditional probabilities of binary covariate=1 at time one
probs <- CalcWeibullRSP(w = sim.data$w, w.res = sim.data$w.res, point = 1,
                        weib.params = calib.weib.params)
summary(probs)
## Not run: 
##D if(interactive()){
##D  #EXAMPLE1
##D  }
## End(Not run)



