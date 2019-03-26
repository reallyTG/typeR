library(RchivalTag)


### Name: get_DayTimeLimits
### Title: Estimating the timing of sunrise, sunset, astronomical and
###   nautical twilight events
### Aliases: get_DayTimeLimits

### ** Examples


#### example 1) estimate current times of dawn, sunrise, dusk and sunset in Mainz, Germany:
pos <- data.frame(Lat=8.2667, Lon=50)
pos$date.long <- strptime(Sys.Date(),"%Y-%m-%d")
get_DayTimeLimits(pos)

#### example 1b) classify current ime of the day in Mainz, Germany:
classify_DayTime(get_DayTimeLimits(pos))





