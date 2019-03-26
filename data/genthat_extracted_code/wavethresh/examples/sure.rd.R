library(wavethresh)


### Name: sure
### Title: Computes the minimum of the SURE thresholding function
### Aliases: sure
### Keywords: math

### ** Examples

#
# Let's create "pretend" vector of wavelet coefficients contaminated with
# "noise".
#
v <- c(0.1, -0.2, 0.3, -0.4, 0.5, 99, 12, 6)
#
# Now, what's sure of this?
#
sure(v)
#
# [1] 0.5
#
#
# I.e. the large significant coefficients are 99, 12, 6 and the noise is
# anything less than this in abs value. So sure(v) is a good point to threshold
# at.



