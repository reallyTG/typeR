library(npsp)


### Name: h.cv
### Title: Cross-validation methods for bandwidth selection
### Aliases: h.cv h.cv.bin.data h.cv.bin.den h.cv.svar.bin hcv.data

### ** Examples

bin <- binning(earthquakes[, c("lon", "lat")], earthquakes$mag)
hcv <- h.cv(bin, ncv = 2)
lp <- locpol(bin, h = hcv$h)
## Alternatively:
## lp <- locpolhcv(earthquakes[, c("lon", "lat")], earthquakes$mag, ncv = 2)

simage(lp, main = 'Smoothed magnitude')
contour(lp, add = TRUE)
with(earthquakes, points(lon, lat, pch = 20))

## Density estimation
hden <- h.cv(as.bin.den(bin))
den <- np.den(bin, h = hden$h)

plot(den, main = 'Estimated log(density)')



