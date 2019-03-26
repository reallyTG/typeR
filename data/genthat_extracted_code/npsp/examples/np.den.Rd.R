library(npsp)


### Name: np.den
### Title: local polynomial density estimation
### Aliases: np.den np.den-class np.den.bin.data np.den.bin.den
###   np.den.default np.den.svar.bin

### ** Examples

bin <- binning(earthquakes[, c("lon", "lat")], earthquakes$mag, nbin = c(30,30))
hden <- h.cv(as.bin.den(bin)) 
den <- np.den(bin, h = hden$h)
## Equivalent to:
## den <- np.den(earthquakes[, c("lon", "lat")], h = hden$h, nbin = c(30,30))

plot(den, main = 'Estimated log(density)')



