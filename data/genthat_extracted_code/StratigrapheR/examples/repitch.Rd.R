library(StratigrapheR)


### Name: repitch
### Title: Converts pitch into declination and inclination
### Aliases: repitch

### ** Examples

strike <- c(90, 135, 135, 135)
dip    <- c(0,  65,  65,  65)
pitch  <- c(40, 40,  140, -40)

earnet()
earplanes(strike,dip,hsphere = "b", a = list(col = "red", lwd = 2))

res <- repitch(pitch = pitch, strike = strike, dip = dip)

earpoints(dec = res$dec, inc = res$inc)




