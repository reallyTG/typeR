library(wavethresh)


### Name: lt.to.name
### Title: Convert desired level and orientation into code used by imwd
### Aliases: lt.to.name
### Keywords: manip

### ** Examples

#
# Generate the character string for the component of the imwd object
#
# The string associated with the diagonal detail at the third level...
#
lt.to.name(3, "DD")
# [1] "w3L3"
#
# Show how to access wavelet coefficients of imwd object.
#
# First, make up some data (using matrix/rnorm) and then subject it
# to an image wavelet transform.
#
tmpimwd <- imwd(matrix(rnorm(64),64,64))
#
# Get the horizontal coefficients at the 2nd level
#
tmpimwd[[ lt.to.name(2, "CD") ]]
# [1]  6.962251e-13  4.937486e-12  3.712157e-12 -3.064831e-12  6.962251e-13
# [6]  4.937486e-12  3.712157e-12 -3.064831e-12  6.962251e-13  4.937486e-12
# [11]  3.712157e-12 -3.064831e-12  6.962251e-13  4.937486e-12  3.712157e-12
# [16] -3.064831e-12
#
#
# If you want the coefficients returned as a matrix use the matrix function,
# i.e.
#
matrix(tmpimwd[[ lt.to.name(2, "CD") ]], 4,4)
#              [,1]          [,2]          [,3]          [,4]
#[1,]  6.962251e-13  6.962251e-13  6.962251e-13  6.962251e-13
#[2,]  4.937486e-12  4.937486e-12  4.937486e-12  4.937486e-12
#[3,]  3.712157e-12  3.712157e-12  3.712157e-12  3.712157e-12
#[4,] -3.064831e-12 -3.064831e-12 -3.064831e-12 -3.064831e-12
#
# Note that the dimensions of the matrix depend on the resolution level
# that you extract and dim = 2^level



