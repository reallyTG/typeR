library(ICcalib)


### Name: CalcNpmleCalibP
### Title: Calculating the probabilities of positive binary exposure status
###   at a given time point using a nonparametric calibration model
### Aliases: CalcNpmleCalibP

### ** Examples

sim.data <- ICcalib:::SimCoxIntervalCensSingle(n.sample = 200, lambda = 0.1, 
                                               alpha = 0.25, beta0 = log(0.5), 
                                               mu = 0.2, n.points = 2, 
                                               weib.shape = 1, weib.scale = 2)
# Fit nonparametric calibration model
fit.npmle <- FitCalibNpmle(w = sim.data$w, w.res = sim.data$w.res)
# Calculate the conditional probabilities of binary covariate=1 at time one
probs <- CalcNpmleCalibP(w = sim.data$w, w.res = sim.data$w.res, 
                         point = 1, fit.npmle = fit.npmle)
summary(probs)



