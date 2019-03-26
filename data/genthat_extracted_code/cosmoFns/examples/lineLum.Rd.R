library(cosmoFns)


### Name: lineLum
### Title: Line luminosity
### Aliases: lineLum
### Keywords: misc

### ** Examples

snu <- 1.e-3 # 1 mJy peak
wid <- 400   # 400 km/s wide
intInt <- 1.06*snu*wid  # Gaussian line
z <- 2.3
lineLum(intInt, z)



