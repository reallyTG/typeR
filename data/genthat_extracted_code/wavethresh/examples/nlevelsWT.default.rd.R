library(wavethresh)


### Name: nlevelsWT.default
### Title: Returns number of levels associated with an object
### Aliases: nlevelsWT.default
### Keywords: arith

### ** Examples

#
# Generate some test data 
#
test.data <- example.1()$y
#
# Now, this vector is 512 elements long. What number of levels would any
# wavelet object be that was associated with this vector?
#
nlevelsWT(test.data)
# [1] 9
#
# I.e. 2^9=512. Let's check by taking the wavelet transform of the
# test data and seeing how many levels it actually has
#
nlevelsWT(wd(test.data))
# [1] 9




