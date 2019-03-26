library(KSD)


### Name: likelihoodgmm
### Title: Calculates the likelihood for a given dataset for a GMM
### Aliases: likelihoodgmm

### ** Examples

# compute likelihood for a default 1-d gaussian mixture model
# and dataset generated from it
model <- gmm()
X <- rgmm(model)
p <- likelihoodgmm(model=model, X=X)



