library(MVNBayesian)


### Name: MixMVN_MCMC
### Title: MCMC simulation for MVN mixture distribution
### Aliases: MixMVN_MCMC
### Keywords: MVN mixture distribution Gibbs sampling MCMC

### ** Examples

library(plyr)
library(mvtnorm)
library(stats)

# dataset2 has 4 parameters: dimen1, dimen2, dimen3 and dimen4:
head(dataset2)
dataset2_dim <- dataset2[,1:4] # extract parametric columns

# Get posteriori parameters of dataset2 using kmeans 3 clustering:
MixBPos <- MixMVN_BayesianPosteriori(dataset2_dim, 3)

# If we want to know when dimen1=1, which clusters are accepted, run:
MixBPos_MCMC <- MixMVN_MCMC(MixBPos, steps=5000, pars=c(1), values=c(1), tol=0.3)
MixBPos_MCMC$AcceptRate
result <- MixBPos_MCMC$MCMCdata
head(result)

# count accepted samples by clustering:
count(result[which(result[,7]==1),5])
## No test: 
library(rgl)
# Visualization using plot3d() if necessary:
# Clustering result in the rest 3 dimensions:
plot3d(result[,2], result[,3], z=result[,4], col=result[,5], size=2)

# Acceptance rejection visualization:
plot3d(result[,2], result[,3], z=result[,4], col=result[,7]+1, size=2)
## End(No test)



