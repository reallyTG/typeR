library(wavethresh)


### Name: AvBasis.wst2D
### Title: Perform basis averaging for (packet-ordered) 2D non-decimated
###   wavelet transform.
### Aliases: AvBasis.wst2D
### Keywords: manip

### ** Examples

#
# Generate some test data
#
#test.data <- matrix(rnorm(16), 4,4)
#
# Now take the 2D packet ordered DWT 
#
#tdwst2D <- wst2D(test.data)
#
# Now "invert" it using basis averaging
#
#tdwstAB <- AvBasis(tdwst2D)
#
# Let's compare it to the original
#
#sum( (tdwstAB - test.data)^2)
#
# [1] 1.61215e-17
#
# Very small. They're essentially same.
#



