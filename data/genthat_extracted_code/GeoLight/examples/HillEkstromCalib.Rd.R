library(GeoLight)


### Name: HillEkstromCalib
### Title: Hill-Ekstrom calibration
### Aliases: HillEkstromCalib

### ** Examples

data(hoopoe2)
  hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
  hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
residency <- with(hoopoe2, changeLight(tFirst,tSecond,type, rise.prob=0.1,
                  set.prob=0.1, plot=FALSE, summary=FALSE))
HillEkstromCalib(hoopoe2,site = residency$site)



