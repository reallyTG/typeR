library(mvdalab)


### Name: loadings
### Title: Summary Information Pertaining to the Bootstrapped Loadings
### Aliases: loadings.mvdareg

### ** Examples

data(Penta)
## Number of bootstraps set to 300 to demonstrate flexibility
## Use a minimum of 1000 (default) for results that support bootstraping
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "oob", boots = 300)
loadings(mod1, ncomp = 2, conf = .95)

data(iris)
pc1 <- pcaFit(iris)
loadings(pc1)



