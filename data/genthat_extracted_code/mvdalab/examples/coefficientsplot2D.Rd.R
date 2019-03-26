library(mvdalab)


### Name: coefficientsplot2D
### Title: 2-Dimensionsl Graphical Summary Information Pertaining to the
###   Coefficients of a PLS
### Aliases: coefficientsplot2D

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
coefficientsplot2D(mod1, comp = c(1, 2))



