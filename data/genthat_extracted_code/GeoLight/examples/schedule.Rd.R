library(GeoLight)


### Name: schedule
### Title: Function for making a data frame summarising residency and
###   movement pattern.
### Aliases: schedule

### ** Examples

data(hoopoe2)
  hoopoe2$tFirst <- as.POSIXct(hoopoe2$tFirst, tz = "GMT")
  hoopoe2$tSecond <- as.POSIXct(hoopoe2$tSecond, tz = "GMT")
residency <- changeLight(hoopoe2, rise.prob=0.1, set.prob=0.1, plot=FALSE, summary=FALSE)
schedule(hoopoe2[,1], hoopoe2[,2], site = residency$site)



