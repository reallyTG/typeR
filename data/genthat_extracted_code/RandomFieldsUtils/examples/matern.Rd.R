library(RandomFieldsUtils)


### Name: matern
### Title: Whittle-Matern Model
### Aliases: whittle matern sobolev whittle-matern
### Keywords: spatial models math

### ** Examples

x <- 3
confirm(matern(x, 0.5), exp(-x))
confirm(matern(x, Inf), gauss(x/sqrt(2)))
confirm(matern(1:2, c(0.5, Inf)), exp(-(1:2)))



