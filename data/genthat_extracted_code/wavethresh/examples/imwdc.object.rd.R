library(wavethresh)


### Name: imwdc.object
### Title: Two-dimensional compressed wavelet decomposition objects.
### Aliases: imwdc.object
### Keywords: classes smooth

### ** Examples

#
# Perform the standard two-dimensional DWT
# on the lennon image.
#
data(lennon)

lwd <- imwd(lennon)
#
# Now let's see how many horizontal detail coefficients there are at
# scale 6
#
length(lwd$w6L1)
# [1] 4096
#
# So the horizontal detail ``image'' at scale contains 64x64=4096 coefficients.
# A lot!
#
# Now, suppose we threshold this
# two-dimensional wavelet decomposition object
#
lwdT <- threshold(lwd)
#
# First of all. What is the class of the detail coefficients now? 
#
class(lwdT$w6L1)
# [1] "compressed"
#
# Aha. So this set of coefficients got compressed using the
# compress.default function.
#
# How many coefficients are being stored here?
#
lwdT$w6L1
# $position:
# [1]  173 2829 2832 2846
#
# $values:
# [1]  141.5455 -190.2810 -194.5714 -177.1791
# 
# $original.length:
# [1] 4096
#
# attr(, "class"):
# [1] "compressed"
#
# Wow! Only 4 coefficients are not zero. Wicked compression!



