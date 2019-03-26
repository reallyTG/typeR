library(Directional)


### Name: BIC for the model based clustering using mixtures of von Mises-Fisher distributions
### Title: BIC to choose the number of components in a model based
###   clustering using mixtures of von Mises-Fisher distributions
### Aliases: bic.mixvmf
### Keywords: Mixtures of von Mises-Fisher distributions BIC of the mixture
###   models

### ** Examples

x <- as.matrix( iris[, 1:4] )
x <- x / sqrt( rowSums(x^2) )
bic.mixvmf(x, 5)



