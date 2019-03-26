library(wavethresh)


### Name: putpacket.wst2D
### Title: Replace packet of coefficients in a two-dimensional
###   non-decimated wavelet object (wst2D).
### Aliases: putpacket.wst2D
### Keywords: manip

### ** Examples

#
# Create a random image. 
#
myrand <- matrix(rnorm(16), nrow=4, ncol=4)
#myrand
#            [,1]       [,2]        [,3]       [,4] 
#[1,]  0.01692807  0.1400891 -0.38225727  0.3372708
#[2,] -0.79799841 -0.3306080  1.59789958 -1.0606204
#[3,]  0.29151629 -0.2028172 -0.02346776  0.5833292
#[4,] -2.21505532 -0.3591296 -0.39354119  0.6147043
#
# Do the 2D non-decimated wavelet transform
#
myrwst2D <- wst2D(myrand)
#
# Let's access the finest scale detail, not shifted in the vertical
# direction.
#
getpacket(myrwst2D, nlevelsWT(myrwst2D)-1, index=0, type="V")
#           [,1]       [,2] 
#[1,] -0.1626819 -1.3244064
#[2,]  1.4113247 -0.7383336
#
# Let's put some zeros in instead...
#
zmat <- matrix(c(0,0,0,0), 2,2)
newwst2D <- putpacket(myrwst2D, nlevelsWT(myrwst2D)-1,
	index=0, packet=zmat, type="V")
#
# And now look at the same packet as before
#
getpacket(myrwst2D, nlevelsWT(myrwst2D)-1, index=0, type ="V")
#     [,1] [,2] 
#[1,]    0    0
#[2,]    0    0
#
# Yup, packet insertion o.k.



