library(ICcalib)


### Name: CalcNpmleRSP
### Title: Calculating the probabilities of positive binary exposure status
###   at a given time point using a nonparametric risk-set calibration
###   models
### Aliases: CalcNpmleRSP

### ** Examples

# Simulate data set
sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
# Calculate the conditional probabilities of binary covariate=1 at time one
# Unlike CalcNpmle, CalcNpmleRSP includes the calibration model fitting
probs <- CalcNpmleRSP(w = sim.data$w, w.res = sim.data$w.res, point = 1, 
                      obs.tm = sim.data$obs.tm)
summary(probs)



