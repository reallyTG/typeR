library(RchivalTag)


### Name: classify_DayTime
### Title: Classifying the time period of the day
### Aliases: classify_DayTime

### ** Examples


#### example 1) estimate current times of dawn, sunrise, dusk and sunset in Mainz, Germany:
pos <- data.frame(Lat=8.2667, Lon=50)
pos$date.long <- strptime(Sys.Date(),"%Y-%m-%d")
get_DayTimeLimits(pos)

#### example 1b) classify current ime of the day in Mainz, Germany:
classify_DayTime(get_DayTimeLimits(pos))

## convert 1c) back-to-back histogram showing day vs night TAD frequencies:
### load sample depth and temperature time series data from miniPAT:
ts_file <- system.file("example_files/104659-Series.csv",package="RchivalTag")
ts_df <- read.table(ts_file, header = TRUE, sep = ",")
tad_breaks <- c(0, 2, 5, 10, 20, 50, 100, 200, 300, 400, 600, 2000)

ts_df$Lat <- 4; ts_df$Lon=42.5 ## required geolocations to estimate daytime
ts_df$date.long <- strptime(paste(ts_df$Day,ts_df$Time),"%d-%B-%Y %H:%M:%S")
head(ts_df)
ts_df2 <- classify_DayTime(get_DayTimeLimits(ts_df)) # estimate daytime
head(ts_df2)

ts2histos(ts_df2, tad_breaks = tad_breaks,split_by = "daytime")
hist_tad(ts_df2, bin_breaks = tad_breaks,split_by = "daytime", do_mid.ticks = FALSE)





