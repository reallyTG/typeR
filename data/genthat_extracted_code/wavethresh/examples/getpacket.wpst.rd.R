library(wavethresh)


### Name: getpacket.wpst
### Title: Get packet of coefficients from a non-decimated wavelet packet
###   object (wpst).
### Aliases: getpacket.wpst
### Keywords: manip

### ** Examples

#
# Create some random data
#
myrand <- rnorm(16)
#myrand
# [1]  0.19268626 -0.41737181 -0.30806613  0.07435407  0.99871757
# [6] -0.58935121 -1.38049759 -0.13346631  1.55555403 -1.60581265
#[11]  0.14353621  1.21277774  1.13762337 -1.08577934 -0.29745609
#[16]  0.50977512
#
# Do the non-decimated wavelet packet transform
#
myrwpst <- wpst(myrand)
#
# Let's access what is a level nlevelsWT(myrwpst)
#
getpacket(myrwpst, nlevelsWT(myrwpst), index=0)
# [1]  0.19268626 -0.41737181 -0.30806613  0.07435407  0.99871757
# [6] -0.58935121 -1.38049759 -0.13346631  1.55555403 -1.60581265
#[11]  0.14353621  1.21277774  1.13762337 -1.08577934 -0.29745609
#[16]  0.50977512
#
# I.e. the data that created the object.
#
# How about extracting the 3rd (last) packet at level 3?
#
getpacket(myrwpst, 3, index=3)
#[1] -2.660657144  0.688415755 -1.764060698  0.717267105 -0.206916242
#[6] -0.659983747  0.005836952 -0.196874007
#
# Of course, there are only 8 coefficients at this level.



