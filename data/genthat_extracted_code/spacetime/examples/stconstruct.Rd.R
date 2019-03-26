library(spacetime)


### Name: stConstruct
### Title: create ST* objects from long or wide tables
### Aliases: stConstruct
### Keywords: manip

### ** Examples

# example 0: construction of STFDF from long table:
library(maps)
states.m = map('state', plot=FALSE, fill=TRUE)
IDs <- sapply(strsplit(states.m$names, ":"), function(x) x[1])
 
library(maptools)
states = map2SpatialPolygons(states.m, IDs=IDs)

library(plm)
data(Produc)

yrs = 1970:1986
t = as.POSIXct(paste(yrs, "-01-01", sep=""), tz = "GMT")
# deselect District of Columbia, polygon 8, which is not present in Produc:
Produc.st = STFDF(states[-8], t, Produc[(order(Produc[,2], Produc[,1])),])

# example 1: st from long table, with states as Spatial object:
# use Date format for time:
Produc$time = as.Date(paste(yrs, "01", "01", sep = "-"))
# take centroids of states:
xy = coordinates(states[-8])
Produc$x = xy[,1]
Produc$y = xy[,2]
#using stConstruct, use polygon centroids for location:
x = stConstruct(Produc, c("x", "y"), "time", interval = TRUE)
class(x)
stplot(x[,,"unemp"])

# alternatively, pass states as SpatialObj:
Produc$state = gsub("TENNESSE", "TENNESSEE", Produc$state)
Produc$State = gsub("_", " ", tolower(Produc$state))
x = stConstruct(Produc, "State", "time", states[-8])
class(x)
all.equal(x, Produc.st, check.attributes = FALSE)

# stConstruct multivariable, time-wide
library(maptools)
fname = system.file("shapes/sids.shp", package="maptools")[1]
nc = readShapePoly(fname, 
	proj4string = CRS("+proj=longlat +datum=NAD27 +ellps=clrk66"))
timesList = list(
	BIR=c("BIR74", "BIR79"),  # sets of variables that belong together
	NWBIR=c("NWBIR74", "NWBIR79"), # only separated by space
	SID=c("SID74", "SID79")
)
t = as.Date(c("1974-01-01","1979-01-01"))
nc.st = stConstruct(as(nc, "data.frame"), geometry(nc), timesList,
	TimeObj = t, interval = TRUE)

# stConstruct multivariable, space-wide
if (require(gstat)) {
data(wind)
wind.loc$y = as.numeric(char2dms(as.character(wind.loc[["Latitude"]])))
wind.loc$x = as.numeric(char2dms(as.character(wind.loc[["Longitude"]])))
coordinates(wind.loc) = ~x+y
proj4string(wind.loc) = "+proj=longlat +datum=WGS84"

# match station order to names in wide table:
stations = 4:15
wind.loc = wind.loc[match(names(wind[stations]), wind.loc$Code),]
row.names(wind.loc) = wind.loc$Station
# convert to utm zone 29, to be able to do interpolation in
# proper Euclidian (projected) space:

# create time variable
wind$time = ISOdate(wind$year+1900, wind$month, wind$day, 0)

w = STFDF(wind.loc, wind$time, 
	data.frame(values = as.vector(t(wind[stations]))))
space = list(values = names(wind)[stations])
wind.st = stConstruct(wind[stations], space, wind$time, SpatialObj = wind.loc, interval = TRUE)
all.equal(w, wind.st)
class(wind.st)
}



