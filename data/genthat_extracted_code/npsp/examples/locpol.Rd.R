library(npsp)


### Name: locpol
### Title: Local polynomial estimation
### Aliases: locpol locpol.bin locpol.bin-class locpol.bin.data
###   locpol.bin.den locpol.default locpol.svar.bin locpolhcv

### ** Examples

lp <- locpol(earthquakes[, c("lon", "lat")], earthquakes$mag, h = diag(2, 2), nbin = c(41,41))
simage(lp, main = "Smoothed magnitude")
contour(lp, add = TRUE)

bin <- binning(earthquakes[, c("lon", "lat")], earthquakes$mag, nbin = c(41,41))
lp2 <- locpol(bin, h = diag(2, 2))
all.equal(lp, lp2)

## Alternatively:
## lp <- locpolhcv(earthquakes[, c("lon", "lat")], earthquakes$mag, ncv = 4)

den <- locpol(as.bin.den(bin), h = diag(1, 2))
plot(den, log = FALSE, main = 'Estimated density')



