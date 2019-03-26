library(wavethresh)


### Name: getpacket.wst2D
### Title: Get packet of coefficients from a two-dimensional non-decimated
###   wavelet object (wst2D).
### Aliases: getpacket.wst2D
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
#
# Compare this to the ordinary 2D DWT for the vertical detail at this
# resolution level
imwd(myrand)[[lt.to.name( 1, "DC")]]
#[1] -0.1626819 -1.3244064  1.4113247 -0.7383336
#
# The same numbers but they're not in matrix format because
# imwd returns vectors not matrices.
#
# Now back to the wst2D object. Let's
# extract vertical detail again at level 1 but this time the horizontally
# shifted data.
#
getpacket(myrwst2D, level=1, index=1, type="V")
#           [,1]      [,2] 
#[1,] -0.5984427 0.2599445
#[2,] -0.6502002 1.8027955
#
# So, yes, different data. Now how about at a deeper resolution level.
# Lets have a horizontal shift, as before, for the level 1 but follow it
# with a diagonal shift and this time extract the smooth component:
#
getpacket(myrwst2D, level=0, index=13, type="S")
#           [,1] 
#[1,] -0.5459394
#
# Of course, only one number because this is at level 0



