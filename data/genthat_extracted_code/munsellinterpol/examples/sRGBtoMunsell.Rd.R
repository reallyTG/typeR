library(munsellinterpol)


### Name: sRGBtoMunsell
### Title: Convert sRGB coordinates to a Munsell specification
### Aliases: sRGBtoMunsell
### Keywords: sRGB

### ** Examples

sRGBtoMunsell( c(255,45,67) )
##                     H        V        C
##  5.4R 5.5/18 5.401135 5.477315 18.01984

sRGBtoMunsell( c(1,0,1), maxSignal=1 )
##                 H        V        C
##  8P 6/26 87.98251 5.981297 25.64534



