library(Compositional)


### Name: Mixture model selection via BIC
### Title: Mixture model selection via BIC
### Aliases: bic.mixcompnorm
### Keywords: mixtures of normal distributions model selection

### ** Examples

library(MASS)
x <- as.matrix( iris[, 1:4] )
x <- x/ rowSums(x)
bic.mixcompnorm(x, 6, type = "alr")
bic.mixcompnorm(x, 6, type = "ilr")



