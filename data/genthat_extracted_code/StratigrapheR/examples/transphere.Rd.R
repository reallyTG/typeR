library(StratigrapheR)


### Name: transphere
### Title: Convertion between declinaison/inclination/intensity and
###   cartesian coordinates
### Aliases: transphere

### ** Examples

transphere(dec = c(65,135), inc = c(32,74))

l <- transphere(dec = c(65,135), inc = c(32,74))
transphere(x = l$x, y = l$y, z = l$z)




