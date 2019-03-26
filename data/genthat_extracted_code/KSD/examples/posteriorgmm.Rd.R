library(KSD)


### Name: posteriorgmm
### Title: Calculates the posterior probability for a given dataset for a
###   GMM
### Aliases: posteriorgmm

### ** Examples

# compute posterior probability for a default 1-d gaussian mixture model
# and dataset generated from it
model <- gmm()
X <- rgmm(model)
p <- posteriorgmm(model=model, X=X)



