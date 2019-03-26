library(wavethresh)


### Name: AvBasis.wst
### Title: Perform basis averaging for (packet-ordered) non-decimated
###   wavelet transform.
### Aliases: AvBasis.wst
### Keywords: manip

### ** Examples

#
# Generate some test data
#
test.data <- example.1()$y
#
# Now take the packet-ordered non-decimated wavelet transform
#
tdwst <- wst(test.data)
#
# Now "invert" it using basis averaging
#
tdwstAB <- AvBasis(tdwst)
#
# Let's compare it to the original
#
sum( (tdwstAB - test.data)^2)
#
# [1] 9.819351e-17 
#
# Very small. They're essentially same.
#
# See the threshold.wst help page for an
# an examples of using basis averaging in curve estimation.



