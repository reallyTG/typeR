library(earthtide)


### Name: Earthtide
### Title: Earthtide class
### Aliases: Earthtide Earthtide-class

### ** Examples


et <- Earthtide$new(
  utc = as.POSIXct("2017-01-01", tz = "UTC") + 0:(24 * 7) * 3600, 
  latitude = 52.3868,
  longitude = 9.7144,
  catalog = "ksm04",
  wave_groups = data.frame(start = 0.0, end = 6.0))

et$predict(method = "gravity", astro_update = 1)

plot(gravity~datetime, et$tide(), type='l')




