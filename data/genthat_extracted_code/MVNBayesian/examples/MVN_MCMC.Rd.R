library(MVNBayesian)


### Name: MVN_MCMC
### Title: MCMC simulation for MVN distribution
### Aliases: MVN_MCMC
### Keywords: MVN distribution Gibbs sampling MCMC

### ** Examples

library(mvtnorm)
library(plyr)

# dataset1 has three parameters: fac1, fac2 and fac3:
head(dataset1)

# Get posteriori parameters of dataset1 using prior of c(80,16,3):
BPos <- MVN_BayesianPosteriori(dataset1, pri_mean=c(80,16,3))

# If we want to know when fac1=78, how fac2 responses to fac3, run:
BPos_MCMC <- MVN_MCMC(BPos, steps=8000, pars=c(1), values=c(78), tol=0.3)
MCMC <- BPos_MCMC$MCMCdata
head(MCMC)
## No test: 
# Visualization using plot3d() if necessary:
library(rgl)
plot3d(MCMC[,1], MCMC[,2], z=MCMC[,3], col=MCMC[,5]+1, size=2)

# Visualization: 2d scatter plot
MCMC_2d <- BPos_MCMC$Accept
head(MCMC_2d)
plot(MCMC_2d[,3], MCMC_2d[,2], pch=20, col="red", xlab = "fac3", ylab = "fac2")

# Compared to the following scatter plot when fac1 is not fixed:
plot(BPos_MCMC$MCMCdata[,3], BPos_MCMC$MCMCdata[,2], pch=20, col="red", xlab = "fac3",
ylab = "fac2")
## End(No test)



