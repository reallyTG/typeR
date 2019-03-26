library(fda)


### Name: powerbasis
### Title: Power Basis Function Values
### Aliases: powerbasis
### Keywords: smooth

### ** Examples


#  set up a set of 10 positive argument values.
x <- seq(0.1,1,0.1)
#  compute values for three power basis functions
exponents <- c(0, 1, 2)
#  evaluate the basis matrix
basismat <- powerbasis(x, exponents)




