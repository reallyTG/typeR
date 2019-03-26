library(suncalc)


### Name: getSunlightPosition
### Title: Get Sunlight position
### Aliases: getSunlightPosition

### ** Examples


# one date
getSunlightPosition(date = Sys.Date(), lat = 50.1, lon = 1.83)

# in character
getSunlightPosition(date = c("2017-05-12", "2017-05-12 00:00:00"), 
    lat = 50.1, lon = 1.83)

# in POSIXct
getSunlightPosition(date = as.POSIXct("2017-05-12 00:00:00", tz = "UTC"),
    lat = 50.1, lon = 1.83)
getSunlightPosition(date = as.POSIXct("2017-05-12 02:00:00", tz = "CET"),
    lat = 50.1, lon = 1.83)

# multiple date + subset
getSunlightPosition(date = seq.Date(Sys.Date()-9, Sys.Date(), by = 1), 
  keep = c("altitude"), 
  lat = 50.1, lon = 1.83)
  
# multiple coordinates
data <- data.frame(date = seq.Date(Sys.Date()-9, Sys.Date(), by = 1), 
    lat = c(rep(50.1, 10), rep(49, 10)), 
    lon = c(rep(1.83, 10), rep(2, 10)))
    
getSunlightPosition(data = data, 
  keep = c("altitude", "azimuth"))

      



