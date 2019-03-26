library(MVNBayesian)


### Name: MixMVN_GibbsSampler
### Title: Gibbs sampler for MVN mixture distribution
### Aliases: MixMVN_GibbsSampler
### Keywords: MVN mixture distribution Gibbs sampling

### ** Examples

library(plyr)
library(mvtnorm)
library(stats)

# Use dataset2 for demonstration. Get parameters of Bayesian
# posteriori multivariate normal mixture distribution
head(dataset2)
dataset2_par <- dataset2[,1:4] # only parameter columns are premitted
MixBPos <- MixMVN_BayesianPosteriori(dataset2_par, species=3)
MixBPos

# Generate random vectors using Gibbs sampling:
MixBPos_Gibbs <- MixMVN_GibbsSampler(5000, MixBPos, random_method = "Gibbs")
head(MixBPos_Gibbs)

# Compared generation speed of "Gibbs" to that of "Fast"
MixBPos_Fast <- MixMVN_GibbsSampler(5000, MixBPos, random_method = "Fast")
head(MixBPos_Fast)
## No test: 
# Visulization by clusters:
library(rgl)
dimen1 <- MixBPos_Gibbs[,1]
dimen2 <- MixBPos_Gibbs[,2]
dimen3 <- MixBPos_Gibbs[,3]
dimen4 <- MixBPos_Gibbs[,4]
plot3d(x=dimen1, y=dimen2, z=dimen3, col=MixBPos_Gibbs[,5], size=2)
## End(No test)



