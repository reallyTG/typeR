library(spacesRGB)


### Name: RGB Space Management
### Title: Manage RGB Spaces
### Aliases: installRGB uninstallRGB getRGB summaryRGB
### Keywords: RGB

### ** Examples

#  install native RGB space for NEC PA242W display
prim = matrix( c(0.675,0.316, 0.199,0.715, 0.157,0.026), 3, 2, byrow=TRUE )
installRGB( 'PA242W', prim, c(0.95047,1,1.08883), OETF=2 )

#  install a linear version of sRGB  (OETF=1)
prim    = matrix( c(0.64,0.33,  0.30,0.60, 0.15,0.06), 3, 2, byrow=TRUE )
installRGB( 'linear-sRGB', prim,  c(0.3127,0.3290),  OETF=1 )    

# make plot comparing three EOTFs
plot( c(0,1), c(0,1), type='n', xlab='Electronic', ylab='Optical', las=1 )
grid(lty=1)
x = seq(0,1,by=1/64)
lines( x, getRGB('sRGB')$EOTF(x), col='black' )
lines( x, getRGB('linear')$EOTF(x), col='red' )
lines( x, getRGB('PA242W')$EOTF(x), col='blue' )

# Install an RGB space named 'HD+2.4', with encoding from BT.709 and display from BT.1886.
# the OOTF for this space is non-trivial
prim    = matrix( c(0.64,0.33,  0.30,0.60,  0.15,0.06 ), 3, 2, byrow=TRUE )
white   = c( 0.3127, 0.3290 )
installRGB( "HD+2.4", prim, white, OETF='BT.709', EOTF=2.4, over=TRUE )

# make plot comparing two OOTFs
plot( c(0,1), c(0,1), type='n', xlab='Optical in', ylab='Optical out', las=1 )
grid(lty=1)
lines( x, getRGB('sRGB')$OOTF(x), col='black' )
lines( x, getRGB('HD+2.4')$OOTF(x), col='red' )



