library(spacetime)


### Name: EOF
### Title: Compute spatial or temporal empirical orthogonal function (EOF)
### Aliases: EOF eof
### Keywords: manip

### ** Examples


if (require(gstat)) {
data(wind)
library(sp)
wind.loc$y = as.numeric(char2dms(as.character(wind.loc[["Latitude"]])))
wind.loc$x = as.numeric(char2dms(as.character(wind.loc[["Longitude"]])))
coordinates(wind.loc) = ~x+y
proj4string(wind.loc) = "+proj=longlat +datum=WGS84"

# match station order to names in wide table:
stations = 4:15
wind.loc = wind.loc[match(names(wind[stations]), wind.loc$Code),]
row.names(wind.loc) = wind.loc$Station
wind$time = ISOdate(wind$year+1900, wind$month, wind$day, 0)
space = list(values = names(wind)[stations])
wind.st = stConstruct(wind[stations], space, wind$time, SpatialObj = wind.loc)
# select firt 500 time steps, to limit run time:
wind.st = wind.st[,1:500]
wind.eof.1 = eof(wind.st)
wind.eof.2 = eof(wind.st, "temporal")
wind.eof.1.PCs = eof(wind.st, returnEOFs = FALSE)
eof(wind.st, "temporal", returnEOFs = FALSE)
summary(eof(wind.st, returnEOFs = FALSE))
summary(eof(wind.st, "temporal", returnEOFs = FALSE))
plot(eof(wind.st, "temporal", returnEOFs = FALSE))
}



