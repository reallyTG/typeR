library(hillmakeR)


### Name: occupancy
### Title: occupancy
### Aliases: occupancy

### ** Examples

library(plyr) # need ddply
attach(hflights) # use hflights dataset

# determine how many planes are at airport each minute
planeCount <- occupancy(startTimes=Arrivals, 
                        stopTimes=Departures, resolution="min", fillup = 0.95)

# determine how many planes are at airport by hour of day using ddply for summary stats
planeCount$hour <- as.POSIXlt(planeCount$times)$hour
byHourOfDay <- ddply(planeCount, c("hour"), 
  function(x) c(mean = mean(x$counts), 
  median = median(x$counts), 
  q90 = quantile(x$counts, 0.9, names = FALSE)))

# display output graphically
plot(byHourOfDay$mean, type = "o")

# Repeat by Carrier, wrapping ddply around call to hillmakeR functions
# This is the pattern to use whenever there are different types of items to count
planeCountbyCarrier <- ddply(hflights, "Carrier", 
  function(x) occupancy(startTimes=x$Arrivals,        
  stopTimes=x$Departures, resolution="min", fillup = 0.95))

# determine how many planes are at airport by hour of day
planeCountbyCarrier$hour <- as.POSIXlt(planeCountbyCarrier$times)$hour
byHourAndCarrier <- ddply(planeCountbyCarrier, c("Carrier", "hour"), 
  function(x) c(mean = mean(x$counts), 
    median = median(x$counts), 
    q90 = quantile(x$counts, 0.9)))

plot(subset(byHourAndCarrier, Carrier == "AA")$mean, ylim = c(0, 12.5), type = "o")
for (i in levels(Carrier)){
  lines(subset(byHourAndCarrier, Carrier == i)$mean, col = sample(colours(), 1), type = "o" )
}

# example of using initial values instead of fillup option with several types of items

# make a dummy lookup table
initial.lookup <- data.frame(key = levels(Carrier), 
                            value = c(380, 164, 131, 74, 114, 
                            161, 334, 106, 127, 498, 485, 158, 
                            68, 100, 60))


planeCountbyCarrier <- ddply(hflights, "Carrier", 
                    function(x) occupancy(startTimes=x$Arrivals, 
                    stopTimes=x$Departures, 
                    resolution="min", 
                    initial = initial.lookup[initial.lookup$key == x$Carrier[1], "value"]))






