library(Data2LD)


### Name: CanadianWeather
### Title: Canadian average annual weather cycle
### Aliases: CanadianWeather
### Keywords: datasets

### ** Examples

##
## 1.  Plot (latitude & longitude) of stations by region
##
with(CanadianWeather, plot(-coordinates[, 2], coordinates[, 1], type='n',
                           xlab="West Longitude", ylab="North Latitude",
                           axes=FALSE) )
Wlon <- pretty(CanadianWeather$coordinates[, 2])
axis(1, -Wlon, Wlon)
axis(2)

rgns <- 1:4
names(rgns) <- c('Arctic', 'Atlantic', 'Continental', 'Pacific')
Rgns <- rgns[CanadianWeather$region]
with(CanadianWeather, points(-coordinates[, 2], coordinates[, 1],
                             col=Rgns, pch=Rgns) )
legend('topright', legend=names(rgns), col=rgns, pch=rgns)

##
## 2.  Plot dailyAv[, 'Temperature.C'] for 4 stations
##
data(CanadianWeather)
# Expand the left margin to allow space for place names
op <- par(mar=c(5, 4, 4, 5)+.1)
# Plot
stations <- c("Pr. Rupert", "Montreal", "Edmonton", "Resolute")
matplot(day.5, CanadianWeather$dailyAv[, stations, "Temperature.C"],
        type="l", axes=FALSE, xlab="", ylab="Mean Temperature (deg C)")
axis(2, las=1)
# Label the horizontal axis with the month names
axis(1, monthBegin.5, labels=FALSE)
axis(1, monthEnd.5, labels=FALSE)
axis(1, monthMid, monthLetters, tick=FALSE)
# Add the monthly averages
matpoints(monthMid, CanadianWeather$monthlyTemp[, stations])
# Add the names of the weather stations
mtext(stations, side=4,
      at=CanadianWeather$dailyAv[365, stations, "Temperature.C"],
     las=1)
# clean up
par(op)



