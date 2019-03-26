library(VGAMextra)


### Name: checkTS.VGAMextra
### Title: Polynomial roots based on _transfer operators_ in Vector
###   Generalized Time Series Family Functions
### Aliases: checkTS.VGAMextra checkTS.ffs

### ** Examples


# A moving average process order-3 with coeffs --> c(2.4, -5.6, 0.83)
#-------------------------#
# This is NOT invertible !
#-------------------------#

MAcoeffs <- c(2.4, -5.6, 0.83)
checkTS.VGAMextra(thetaEst = MAcoeffs, 
                  tsclass = "MA", 
                  chOrder = 3,
                  retmod = FALSE)


# AR process order-3 with coeffs --> c( 0.45, 0.45^2, 0.45^3 )
#-------------------------#
# This is stationary !
#-------------------------#

ARcoeffs <- c( 0.45 , 0.45^2 , 0.45^3 )
checkTS.VGAMextra(thetaEst = ARcoeffs, 
                  tsclass = "AR", 
                  chOrder = 3,
                  retmod = TRUE,
                  pRoots = TRUE)  # DEFAULT for 'pRoots'



