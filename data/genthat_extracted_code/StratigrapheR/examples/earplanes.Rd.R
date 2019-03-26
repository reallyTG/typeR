library(StratigrapheR)


### Name: earplanes
### Title: Draws planes on an equal area stereonet
### Aliases: earplanes

### ** Examples

strike   <- c(45,  0)
dip      <- c(20, 65)

earnet()
earplanes(strike,dip,hsphere = "b")

encircle(earinc(dip))




