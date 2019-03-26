library(KSD)


### Name: scorefunctiongmm
### Title: Score function for given GMM : calculates score function
###   dlogp(x)/dx for a given Gaussian Mixture Model
### Aliases: scorefunctiongmm

### ** Examples

# Compute score for a given gaussianmixture model and dataset
model <- gmm()
X <- rgmm(model)
score <- scorefunctiongmm(model=model, X=X)



