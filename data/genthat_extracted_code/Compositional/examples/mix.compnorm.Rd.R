library(Compositional)


### Name: Gaussian mixture models for compositional data
### Title: Gaussian mixture models for compositional data
### Aliases: mix.compnorm
### Keywords: Gaussian mixtures model based clustering

### ** Examples

x <- as.matrix(iris[, 1:4])
mod1 <- mix.compnorm(x, 3, model = "EII" )
mod2 <- mix.compnorm(x, 4, model = "VII")



