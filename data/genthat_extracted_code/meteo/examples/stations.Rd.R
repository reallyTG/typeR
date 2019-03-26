library(meteo)


### Name: stations
### Title: Data frame containing stations' information
### Aliases: stations
### Keywords: datasets

### ** Examples

## load data:
data(stations)
str(stations)
library(sp)
coordinates(stations) <-~ lon +lat
stations@proj4string <-CRS('+proj=longlat +datum=WGS84')
plot(stations)



