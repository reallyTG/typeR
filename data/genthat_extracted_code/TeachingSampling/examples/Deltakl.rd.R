library(TeachingSampling)


### Name: Deltakl
### Title: Variance-Covariance Matrix of the Sample Membership Indicators
###   for Fixed Size Without Replacement Sampling Designs
### Aliases: Deltakl
### Keywords: survey

### ** Examples

# Vector U contains the label of a population of size N=5
U <- c("Yves", "Ken", "Erik", "Sharon", "Leslie")
N <- length(U)
# The sample size is n=2
n <- 2
# p is the probability of selection of every sample. 
p <- c(0.13, 0.2, 0.15, 0.1, 0.15, 0.04, 0.02, 0.06, 0.07, 0.08)
# Note that the sum of the elements of this vector is one
sum(p)
# Computation of the Variance-Covariance matrix of the sample membership indicators
Deltakl(N, n, p)



