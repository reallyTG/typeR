library(wavethresh)


### Name: madmad
### Title: Compute square of median absolute deviation (mad) function.
### Aliases: madmad
### Keywords: arith

### ** Examples

#
#
# Generate some normal data with mean 0 and sd of 8
# and we'll also contaminate it with an outlier of 1000000
# This is akin to signal wavelet coefficients mixing with the noise.
#
ContamNormalData <- c(1000000, rnorm(1000, mean=0, sd=8))
#
# What is the variance of the data?
#
var(ContamNormalData)
# [1] 999000792
#
# Wow, a seriously unrobust answer!
#
# How about the median absolute deviation?
#
mad(ContamNormalData)
# [1] 8.14832
# 
# A much better answer!
#
# Now let's use madmad to get the answer on the variance scale 
#
madmad(ContamNormalData)
# [1] 66.39512
#
# The true variance was 64, so the 66.39512 was a much better answer
# than that returned by the call to the variance function.



