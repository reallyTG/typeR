library(spacesXYZ)


### Name: adapt
### Title: Chromatic Adaptation Functions
### Aliases: adaptxyY.CAT adaptxyY adaptXYZ.CAT adaptXYZ adaptLab.CAT
###   adaptLab adaptLuv.CAT adaptLuv
### Keywords: adaptation

### ** Examples

# try the Bradford method
bCAT = CAT( 'D50', 'D65', method='bradford' )

adaptXYZ( bCAT, c(1,1,0.5) )
##               X         Y         Z
##  [1,] 0.9641191 0.9921559 0.6567701


adaptLab( bCAT, c(50,20,-10) )
##              L        a         b
##  [1,] 49.97396 20.84287 -10.19661      # as expected, there is a change

adaptLab( bCAT, c(40,0,0) )
##        L a b
##  [1,] 40 0 0   # but adaptLab() always preserves neutrals


adaptLuv( bCAT, c(40,0,0) )
##        L u v
##  [1,] 40 0 0   # and adaptLuv() also preserves neutrals



# try the scaling method - now XYZ are scaled independently
sCAT = CAT( 'D50', 'D65', method='scaling' )

adaptLab( sCAT, c(50,20,-10) )
##        L  a   b
##  [1,] 50 20 -10    with sCAT, adaptLab() is now the identity for *all* colors


adaptLuv( sCAT, c(50,-20,10) )
##        L         u        v
##  [1,] 50 -18.32244 11.29946    but adaptLuv() is NOT the identity for all colors



