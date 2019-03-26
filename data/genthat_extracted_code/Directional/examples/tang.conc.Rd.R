library(Directional)


### Name: A test for testing the equality of the concentration parameters for ciruclar data
### Title: A test for testing the equality of the concentration parameter
###   among g samples, where g >= 2 for ciruclar data
### Aliases: tang.conc
### Keywords: Circular data Equality of concentrations Hypothesis testing

### ** Examples

x <- rvonmises(100, 2.4, 15)
ina <- rep(1:4,each = 25)
tang.conc(x, ina, rads = TRUE)



