library(Compositional)


### Name: Estimating location and scatter parameters for compositional data
### Title: Estimating location and scatter parameters for compositional
###   data
### Aliases: comp.den
### Keywords: location and scatter robust estimation

### ** Examples

library(MASS)
x <- as.matrix(iris[, 1:4])
x <- x / rowSums(x)
comp.den(x)
comp.den(x, type = "alr", dist = "t")
comp.den(x, type = "alr", dist = "spatial")



