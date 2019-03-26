library(munsellinterpol)


### Name: RGBtoMunsell
### Title: Convert sRGB coordinates to a Munsell specification
### Aliases: RGBtoMunsell
### Keywords: RGB

### ** Examples

RGBtoMunsell( c(255,45,67) )
##                     H        V        C
##  5.4R 5.5/18 5.401135 5.477315 18.01984

RGBtoMunsell( c(255,45,67), space='Adobe' )
##                     H        V        C
##  5.9R 6.2/22 5.924749 6.214155 21.83907



