library(suncalc)


### Name: getSunlightTimes
### Title: Get Sunlight times
### Aliases: getSunlightTimes

### ** Examples


# one date
getSunlightTimes(date = Sys.Date(), lat = 50.1, lon = 1.83, tz = "CET")

# multiple date + subset
getSunlightTimes(date = seq.Date(Sys.Date()-9, Sys.Date(), by = 1), 
  keep = c("sunrise", "sunriseEnd", "sunset", "sunsetStart"), 
  lat = 50.1, lon = 1.83, tz = "CET")
  
# multiple coordinates
data <- data.frame(date = seq.Date(Sys.Date()-9, Sys.Date(), by = 1), 
    lat = c(rep(50.1, 10), rep(49, 10)), 
    lon = c(rep(1.83, 10), rep(2, 10)))
    
getSunlightTimes(data = data, 
  keep = c("sunrise", "sunriseEnd", "sunset", "sunsetStart"), tz = "CET")
      



