library(npphen)


### Name: PhenAnoma
### Title: PhenAnoma
### Aliases: PhenAnoma

### ** Examples

## Don't show: 
## Testing function with time series of Slovenian data (EVI)

# Load data
phents<-read.table(system.file("extdata/date_tables/datats",package="npphen"),dec='.',
sep='\t',header=TRUE)

# Anomaly of the phenology for the given data

PhenAnoma(x=as.vector(phents$x),dates=phents$dates,h=1,refp=c(1:150),
anop=c(128:150), rge=c(0,10000))
## End(Don't show)

## No test: 
library(rts)
library(lubridate)

## Testing North Hemisphere data. Raster data from Slovenia (EVI index), h=1 ##

# Load data
sl.path<-system.file("extdata/HN_slovenia",package="npphen")
sl_rasters<-list.files(path=sl.path, pattern=glob2rx("slovenia*.tif"), full.names=TRUE)
Slovenia_rasters<-stack(sl_rasters)
sl_dates<-read.csv(system.file("extdata/date_tables/Slovenia_dates.csv", package="npphen"))
Slovenia_dates <- as.Date(sl_dates$date, format='%d/%m/%Y')

# Generate a Raster time series using a raster stack and a date database from Slovenia
sl_ts<-rts(Slovenia_rasters,Slovenia_dates)

# Obtain data from a particular pixel generating a time series
sl_pixel<-cellFromXY(sl_ts,c(474368,5096979))
sl_pixelts<-extract(sl_ts,sl_pixel)
plot(sl_pixelts)

# Calculating the anomalies for the last growing season [343:365], refp [1:342]
# In this case refp and anop do not overlap
PhenAnoma(x=as.vector(sl_pixelts),dates=Slovenia_dates,h=1,refp=c(1:342),
anop=c(343:365), rge=c(0,10000))


## Testing South Hemisphere data. Raster data from Chile (EVI index), h=2 ##

# Load data
ay.path<-system.file("extdata/HS_aysen",package="npphen")
ayrasters<-list.files(path=ay.path, pattern=glob2rx("aysen*.tif"), full.names=TRUE)
Aysen_rasters<-stack(ayrasters)
ay_dates<-read.csv(system.file("extdata/date_tables/Aysen_dates.csv", package="npphen"))
Aysen_dates <- as.Date(ay_dates$date, format='%d/%m/%Y')

# Generate a Raster time series using a raster stack and a date database from Aysen
ay_ts<-rts(Aysen_rasters,Aysen_dates)

# Obtain data from a particular pixel generating a time series
ay_pixel<-cellFromXY(ay_ts,c(228373,4806975))
ay_pixelts<-extract(ay_ts,ay_pixel)
plot(ay_pixelts)

# Anomaly for the period [309:331], reference period [1:354]. In this case, ref and anop overlaps
PhenAnoma(x=as.vector(ay_pixelts),dates=Aysen_dates,h=2,refp=c(1:354),
anop=c(309:331), rge=c(0,10000))
## End(No test)



