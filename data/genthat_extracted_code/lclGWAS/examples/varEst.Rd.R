library(lclGWAS)


### Name: varEst
### Title: Estimate the Frailty Variance for Discrete-Time Multivariate
###   Frailty Model for Grouped Survival Data
### Aliases: varEst

### ** Examples

# Generate dummy data	
fam_group <- rep(1:3,each=3)
alpha <- c(0.7500000, 0.6666667, 0.5000000, 0.0000000)
dtime <- c(1, 3, 3, 2, 1, 1, 2, 3, 1)
delta <- c(1, 0, 1, 1, 1, 0, 1, 0, 1)
g     <- c(0, 1, 1, 1, 2, 2, 0, 0, 0)
beta  <- 1
res   <- varEst(fam_group, alpha, dtime, delta, g, beta, lower = 0, upper = 2) 
res



