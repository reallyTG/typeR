library(spacesRGB)


### Name: spacesRGB-package
### Title: Calculate with RGB spaces
### Aliases: spacesRGB-package
### Keywords: package

### ** Examples

# Install an RGB space named 'HD+2.4', with encoding from BT.709 and display from BT.1886.
# the OOTF for this space is non-trivial

prim    = matrix( c(0.64,0.33,  0.30,0.60,  0.15,0.06 ), 3, 2, byrow=TRUE )
white   = c( 0.3127, 0.3290 )
    
installRGB( "HD+2.4", prim, white, OETF='BT.709', EOTF=2.4, overwrite=TRUE )



