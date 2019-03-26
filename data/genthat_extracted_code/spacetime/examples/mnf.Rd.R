library(spacetime)


### Name: mnf
### Title: Generic mnf method
### Aliases: mnf mnf.RasterBrick mnf.RasterStack mnf.SpatialGridDataFrame
###   mnf.SpatialPixelsDataFrame mnf.matrix mnf.mts mnf.zoo mnf.STSDF
###   mnf.STFDF

### ** Examples

# temporal data:
set.seed(13531) # make reproducible
s1 = arima.sim(list(ma = rep(1,20)), 500)
s2 = arima.sim(list(ma = rep(1,20)), 500)
s3 = arima.sim(list(ma = rep(1,20)), 500)
s3 = s3 + rnorm(500, sd = 10)
d = cbind(s1,s2,s3)
plot(d)
m = mnf(d)
m
summary(m)
plot(predict(m))

# spatial example:
## Not run: 
##D library(sp)
##D grd = SpatialPoints(expand.grid(x=1:100, y=1:100))
##D gridded(grd) = TRUE
##D fullgrid(grd) = TRUE
##D pts = spsample(grd, 50, "random")
##D pts$z = rnorm(50)
##D library(gstat)
##D v = vgm(1, "Sph", 90)
##D out = krige(z~1, pts, grd, v, nmax = 20, nsim = 4)
##D out[[3]] = 0.5 * out[[3]] + 0.5 * rnorm(1e4)
##D out[[4]] = rnorm(1e4)
##D spplot(out, as.table = TRUE)
##D m = mnf(out)
##D m
##D summary(m)
## End(Not run)
if (require(gstat)) {
 data(wind)
 library(sp)
 wind.loc$y = as.numeric(char2dms(as.character(wind.loc[["Latitude"]])))
 wind.loc$x = as.numeric(char2dms(as.character(wind.loc[["Longitude"]])))
 coordinates(wind.loc) = ~x+y
 proj4string(wind.loc) = "+proj=longlat +datum=WGS84"

 # match station order to names in wide table:
 stations = 4:15
 wind.loc = wind.loc[match(names(wind[stations]), wind.loc$Code),]
 row.names(wind.loc) = wind.loc$Station
 wind$time = ISOdate(wind$year+1900, wind$month, wind$day, 0)
 space = list(values = names(wind)[stations])
 wind.st = stConstruct(wind[stations], space, wind$time, SpatialObj = wind.loc, interval = TRUE)
 m = mnf(wind.st)
 m
 plot(m)
 stplot(predict(m), mode = "tp")
}




