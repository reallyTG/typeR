library(suncalc)


### Name: getMoonIllumination
### Title: Get Moon illumination
### Aliases: getMoonIllumination

### ** Examples


# one date
getMoonIllumination(date = Sys.Date())

# in character
getMoonIllumination(date = c("2017-05-12", "2017-05-12 00:00:00"), 
  keep = c("fraction", "phase"))

# in POSIXct
getMoonIllumination(date = as.POSIXct("2017-05-12 00:00:00", tz = "UTC"))
getMoonIllumination(date = as.POSIXct("2017-05-12 02:00:00", tz = "CET"))

      



