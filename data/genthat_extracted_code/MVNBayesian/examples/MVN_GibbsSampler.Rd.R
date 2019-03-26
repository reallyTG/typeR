library(MVNBayesian)


### Name: MVN_GibbsSampler
### Title: Gibbs sampler for MVN distribution
### Aliases: MVN_GibbsSampler
### Keywords: MVN distribution Gibbs sampling

### ** Examples

library(mvtnorm)

# Get parameters of Bayesian posteriori multivariate normal distribution
BPos <- MVN_BayesianPosteriori(dataset1)
BPos

# Using previous result (BPos) to generate random vectors through Gibbs
# sampling: 7000 observations, start from c(1,1,2), use 0.3 burning rate
BPos_Gibbs <- MVN_GibbsSampler(7000, BPos, initial=c(1,1,2), 0.3)
tail(BPos_Gibbs)

# Check for convergence of Markov chain
BPos$mean
colMeans(BPos_Gibbs)
BPos$var
var(BPos_Gibbs)
## No test: 
# 3d Visulization:
library(rgl)
fac1 <- BPos_Gibbs[,1]
fac2 <- BPos_Gibbs[,2]
fac3 <- BPos_Gibbs[,3]
plot3d(x=fac1, y=fac2, z=fac3, col="red", size=2)
## End(No test)



