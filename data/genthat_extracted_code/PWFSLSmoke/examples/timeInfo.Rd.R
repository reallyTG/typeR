library(PWFSLSmoke)


### Name: timeInfo
### Title: Get Time Related Information
### Aliases: timeInfo

### ** Examples

carmel <- monitor_subset(Carmel_Valley, tlim=c(20160801,20160810))

# Create timeInfo object for this monitor
ti <- timeInfo(carmel$data$datetime,
               carmel$meta$longitude,
               carmel$meta$latitude,
               carmel$meta$timezone)

# Subset the data based on day/night masks
data_day <- carmel$data[ti$day,]
data_night <- carmel$data[ti$night,]

# Build two monitor objects
carmel_day <- list(meta=carmel$meta, data=data_day)
carmel_night <- list(meta=carmel$meta, data=data_night)

# Plot them
monitorPlot_timeseries(carmel_day, shadedNight=TRUE, pch=8, col='goldenrod')
monitorPlot_timeseries(carmel_night, pch=16, col='darkblue', add=TRUE)



