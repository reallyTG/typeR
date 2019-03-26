library(GeoLight)


### Name: changeLight
### Title: Residency analysis using a changepoint model
### Aliases: changeLight

### ** Examples

data(hoopoe2)
  hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
  hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
residency <- changeLight(hoopoe2, quantile=0.9)



