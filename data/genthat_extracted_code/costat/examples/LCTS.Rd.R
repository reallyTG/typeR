library(costat)


### Name: LCTS
### Title: Computes a Linear Combination Test Statistics
### Aliases: LCTS
### Keywords: ts

### ** Examples

#
# Apply this function to random combination coefficients.
#
# The combination coefficients: comprised of two vectors each of length 3
# Note that 3 = 2^2 - 1, vectors need to be of length a power two minus 1 
#
#	sret, fret are two time series in the package
#
data(sret)
data(fret)
LCTS( c(rnorm(3), rnorm(3)), sret, fret)
#[1] 1.571728e-13
#
# The value of the test statistic is 1.57e-13



