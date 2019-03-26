library(lclGWAS)


### Name: alphaEst
### Title: Estimate the Interval Baseline Survival Rates for Discrete-Time
###   Multivariate Frailty Model for Grouped Survival Data
### Aliases: alphaEst

### ** Examples

# Generate dummy data	
dtime <- c(1, 3, 3, 2, 1, 1, 2, 3, 1)
delta <- c(1, 0, 1, 1, 1, 0, 1, 0, 1)
res   <- alphaEst(dtime, delta) 
res



