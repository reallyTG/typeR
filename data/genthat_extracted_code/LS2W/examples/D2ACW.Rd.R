library(LS2W)


### Name: D2ACW
### Title: Compute 2-D discrete autocorrelation wavelets.
### Aliases: D2ACW
### Keywords: models

### ** Examples

#
# Let us create the discrete autocorrelation wavelets for the Haar wavelet.
# We shall create up to scale 2.
#
D2ACW(J=-2, filter.number=1, family="DaubExPhase", switch="direction")
#[[1]]:
#      [,1] [,2]  [,3]
#[1,] -0.25 -0.5 -0.25
#[2,]  0.50  1.0  0.50
#[3,] -0.25 -0.5 -0.25
#
#[[2]]:
#        [,1]   [,2]    [,3]  [,4]    [,5]   [,6]    [,7]
#[1,] -0.0625 -0.125 -0.1875 -0.25 -0.1875 -0.125 -0.0625
#[2,] -0.1250 -0.250 -0.3750 -0.50 -0.3750 -0.250 -0.1250
#[3,]  0.0625  0.125  0.1875  0.25  0.1875  0.125  0.0625
#[4,]  0.2500  0.500  0.7500  1.00  0.7500  0.500  0.2500
#[5,]  0.0625  0.125  0.1875  0.25  0.1875  0.125  0.0625
#[6,] -0.1250 -0.250 -0.3750 -0.50 -0.3750 -0.250 -0.1250
#[7,] -0.0625 -0.125 -0.1875 -0.25 -0.1875 -0.125 -0.0625
#
#... and the remaining terms follow suit. 



