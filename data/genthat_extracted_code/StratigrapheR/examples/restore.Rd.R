library(StratigrapheR)


### Name: restore
### Title: Plane correction
### Aliases: restore

### ** Examples

dec <- c(90,210)
inc <- c(20,60)

strike <- c(0,120)
dip    <- c(20,60)
inverted <- c(FALSE,TRUE)

res <- restore(dec = dec, inc = inc, strike = strike, dip = dip,
               quadrant = NA, inverted = inverted,
               percent = seq(20,100, by = 20))

earnet()
earplanes(strike, dip)
earpoints(dec,inc)
earpoints(round(res$dec,2), round(res$inc,2), a = list(pch = 22))




