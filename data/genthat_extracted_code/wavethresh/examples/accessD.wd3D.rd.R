library(wavethresh)


### Name: accessD.wd3D
### Title: Get wavelet coefficients from 3D wavelet object
### Aliases: accessD.wd3D
### Keywords: manip

### ** Examples

#
# Generate some test data
#
a <- array(rnorm(8*8*8), dim=c(8,8,8))
#
# Perform the 3D DWT
#
awd3D <- wd3D(a)
#
# How many levels does this object have?
#
nlevelsWT(awd3D)
# [1] 3
#
# So conceivably we could access levels 0, 1 or 2.
#
# Ok. Let's get the level 1 HGH sub-block coefficients:
#
accessD(awd3D, level=1, block="HGH")
#
#, , 1
#           [,1]      [,2] 
#[1,]  0.8359289 1.3596832
#[2,] -0.1771688 0.2987303
#
#, , 2
#           [,1]       [,2] 
#[1,] -1.2633313 1.00221652
#[2,] -0.3004413 0.04728019
#
# This was a 3D array of dimension size 2 (8 -> 4 -> 2, level 3, 2 and then 1)
#
#
# Let's do the same call except this time don't specify the block arg.
#
alllev1 <- accessD(awd3D, level=1)
#
# This new object should be a list containing all the subblocks at this level.
# What are the components?
#
names(alllev1)
#[1] "GHH" "HGH" "GGH" "HHG" "GHG" "HGG" "GGG"
#
# O.k. Let's look at HGH again
#
alllev1$HGH
#
#, , 1
#           [,1]      [,2] 
#[1,]  0.8359289 1.3596832
#[2,] -0.1771688 0.2987303
#
#, , 2
#           [,1]       [,2] 
#[1,] -1.2633313 1.00221652
#[2,] -0.3004413 0.04728019
#
# Same as before.
#



