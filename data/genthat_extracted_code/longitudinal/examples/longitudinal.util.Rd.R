library(longitudinal)


### Name: longitudinal.util
### Title: Utility Functions for the "Longitudinal" Data Structure
### Aliases: longitudinal.util get.time.repeats is.equally.spaced
###   is.regularly.sampled has.repeated.measurements combine.longitudinal
###   condense.longitudinal
### Keywords: ts

### ** Examples

# load "longitudinal" library
library("longitudinal")


# load tcell data set
data(tcell)
dim(tcell.34)
is.longitudinal(tcell.34)
summary(tcell.34)

# information
get.time.repeats(tcell.34)
is.equally.spaced(tcell.34)
is.regularly.sampled(tcell.34)
has.repeated.measurements(tcell.34)

# compute the mean value at each time point for the first two gene
condense.longitudinal(tcell.34, 1:2, mean)


# combine two time series
m1 <- matrix(rnorm(100), 50, 2)
m2 <- matrix(rnorm(100), 50, 2)
z1 <- as.longitudinal(m1, repeats=c(10,5,5,10,20), time=c(2,8,9,15,16))
z2 <- as.longitudinal(m2, repeats=c(10,5,5,10,20), time=c(1,8,9,15,20))

z3 <- combine.longitudinal(z1,z2)
summary(z3)
get.time.repeats(z3)  # compare with z1 and z2



