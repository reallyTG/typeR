library(circular)


### Name: conversion.circular
### Title: Unit of Measure Conversion for Circular Data and other
###   conversions
### Aliases: conversion.circular
### Keywords: misc

### ** Examples

x <- rvonmises(n=10, mu=circular(0), kappa=9, control.circular=list(units="degrees"))
par(mfcol=c(2, 2))
plot(x)
y <- conversion.circular(x) # only the unit is changed (to radians) and 
####### the data converted.
plot(y)
z <- conversion.circular(x, units="degrees", zero=pi) # only the zero is changed and 
####### the data converted.
plot(z)
w <- conversion.circular(x, zero=pi, rotation="clock") # zero and rotation is 
####### changed and the data converted.
plot(w)



