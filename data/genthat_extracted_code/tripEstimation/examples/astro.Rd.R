library(tripEstimation)


### Name: astro
### Title: Calculations for position of the sun and moon
### Aliases: astro EQUHOR FRAC LMST lunar mini.sun MJD POLAR
### Keywords: manip

### ** Examples


## the moon
tm <- Sys.time() + seq(by = 3600, length = 100)
moon <- lunar(tm)
rtp <- astro(147, -42, moon)
op <- par(mfrow = c(2,1))
plot(tm, rtp$theta, main = "lunar elevation, Hobart")
plot(tm, rtp$phi, main = "lunar azimuth, Hobart")
par(op)

## the sun
tm <- Sys.time() + seq(by = 3600, length = 100)
sun <- mini.sun(tm)
rtp <- astro(147, -42, sun)
op <- par(mfrow = c(2,1))
plot(tm, rtp$theta, main = "solar elevation, Hobart")
plot(tm, rtp$phi, main = "solar azimuth, Hobart")
par(op)
## Not run: 
##D   elev.gmt <- mkElevationSeg(1, tm)
##D   plot(tm, rtp$theta, main = "solar elevation mini.sun versus NOAA") 
##D   lines(tm, elev.gmt(1, 147, -42))
## End(Not run)



