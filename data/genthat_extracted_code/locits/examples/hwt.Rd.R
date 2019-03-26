library(locits)


### Name: hwt
### Title: Compute a Haar wavelet transform for data of arbitrary n length
### Aliases: hwt
### Keywords: math smooth nonlinear

### ** Examples

#
# Generate test data set of length 5 (note, NOT a power of two)
#
v2 <- rnorm(5)
#
# Compute its Haar transform
#
v2hwt <- hwt(v2)
#
# How many levels does it have?
#
nlevelsWT(v2hwt)
#
# What are the coarsest scale wavelet coefficients
#
v2hwt$d[[1]]
#
# What are the finest scale scaling function coefficients
#
v2hwt$c[[nlevels(v2hwt$c)-1]]



