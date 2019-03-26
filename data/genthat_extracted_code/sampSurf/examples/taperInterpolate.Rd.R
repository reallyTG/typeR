library(sampSurf)


### Name: taperInterpolate
### Title: Interpolate Diameters or Lengths in a '"Stem"' Object
### Aliases: taperInterpolate
### Keywords: ~kwd1 ~kwd2

### ** Examples

dl = downLog(buttDiam=12, topDiam=2, logLen=10, units="English")
dl@taper
taperInterpolate(dl, pts=c(2.6, 4.1, 7.2))



