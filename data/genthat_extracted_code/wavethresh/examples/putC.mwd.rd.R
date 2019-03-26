library(wavethresh)


### Name: putC.mwd
### Title: Put smoothed data into wavelet structure
### Aliases: putC.mwd
### Keywords: manip

### ** Examples

#
# Generate an mwd object
#
tmp <- mwd(rnorm(32))
#
# Now let's examine the finest resolution smooth...
#
accessC(tmp, level=3)
#           [,1]       [,2]       [,3]       [,4]        [,5]      [,6] 
#[1,] -0.4669103 -1.3150580 -0.7094966 -0.1979214  0.32079986 0.5052254
#[2,] -0.7645379 -0.8680941  0.1004062  0.6633268 -0.05860848 0.5757286
#          [,7]       [,8] 
#[1,] 0.5187380  0.6533843
#[2,] 0.2864293 -0.4433788
#
# A matrix. There are two rows one for each father wavelet in this 
# two-ple multiple wavelet transform and at level 3 there are 2^3 columns.
#
# Let's set the coefficients of the first father wavelet all equal to zero
# for this examples
#
newcmat <- accessC(tmp, level=3)
newcmat[1,] <- 0
#
# Ok, let's insert it back at level 3
#
tmp2 <- putC(tmp, level=3, M=newcmat)
#
# And check it
#
accessC(tmp2, level=3)   
#           [,1]       [,2]      [,3]      [,4]        [,5]      [,6]      [,7] 
#[1,]  0.0000000  0.0000000 0.0000000 0.0000000  0.00000000 0.0000000 0.0000000
#[2,] -0.7645379 -0.8680941 0.1004062 0.6633268 -0.05860848 0.5757286 0.2864293
#           [,8] 
#[1,]  0.0000000
#[2,] -0.4433788
#
# Yep, all the first father wavelet coefficients at level 3 are now zero.



