library(mvdalab)


### Name: weightsplot2D
### Title: Extract a 2-Dimensional Graphical Summary Information Pertaining
###   to the weights of a PLS Analysis
### Aliases: weightsplot2D

### ** Examples

data(Penta)
mod1 <- plsFit(log.RAI ~., scale = TRUE, data = Penta[, -1],
               ncomp = 2, validation = "loo")
weightsplot2D(mod1, comp = c(1, 2))



