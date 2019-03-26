library(wavethresh)


### Name: putD.mwd
### Title: Put wavelet coefficients into multiple wavelet structure
### Aliases: putD.mwd
### Keywords: manip

### ** Examples

#
# Generate an mwd object
#
tmp <- mwd(rnorm(32))
#
# Now let's examine the finest resolution detail...
#
accessD(tmp, level=3)
#          [,1]       [,2]       [,3]      [,4]       [,5]        [,6] 
#[1,] 0.8465672  0.4983564  0.3408087 0.1340325  0.5917774 -0.06804291
#[2,] 0.6699962 -0.2535760 -1.0344445 0.2068644 -0.4912086  1.16039885
#           [,7]       [,8] 
#[1,] -0.6226445  0.2617596
#[2,] -0.4956576 -0.5555795
#
#
# A matrix. There are two rows one for each mother wavelet in this 
# two-ple multiple wavelet transform and at level 3 there are 2^3 columns.
#
# Let's set the coefficients of the first mother wavelet all equal to zero
# for this examples
#
newdmat <- accessD(tmp, level=3)
newdmat[1,] <- 0
#
# Ok, let's insert it back at level 3
#
tmp2 <- putD(tmp, level=3, M=newdmat)
#
# And check it
#
accessD(tmp2, level=3)   
#          [,1]      [,2]      [,3]      [,4]       [,5]     [,6]       [,7] 
#[1,] 0.0000000  0.000000  0.000000 0.0000000  0.0000000 0.000000  0.0000000
#[2,] 0.6699962 -0.253576 -1.034445 0.2068644 -0.4912086 1.160399 -0.4956576
#           [,8] 
#[1,]  0.0000000
#[2,] -0.5555795
#
#
# Yep, all the first mother wavelet coefficients at level 3 are now zero.



