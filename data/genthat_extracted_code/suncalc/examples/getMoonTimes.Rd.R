library(suncalc)


### Name: getMoonTimes
### Title: Get Moon times
### Aliases: getMoonTimes

### ** Examples


# one date
getMoonTimes(date = Sys.Date(), lat = 47.21, lon = -1.557, tz = "CET")

# multiple date + subset
getMoonTimes(date = seq.Date(Sys.Date()-9, Sys.Date(), by = 1), 
  keep = c("rise", "set", "alwaysUp"), 
  lat = 47.21, lon = -1.557, tz = "CET")
  
# multiple coordinates
data <- data.frame(date = seq.Date(Sys.Date()-9, Sys.Date(), by = 1), 
    lat = c(rep(50.1, 10), rep(49, 10)), 
    lon = c(rep(1.83, 10), rep(2, 10)))
    
getMoonTimes(data = data, tz = "CET")
      



