library(npphen)


### Name: PhenMap
### Title: PhenMap
### Aliases: PhenMap

### ** Examples

## No test: 
##DEPENDING ON HARDWARE, THIS PROCESS CAN BE HIGHLY TIME CONSUMING##

## Testing North Hemisphere data. Raster data from Slovenia (EVI index), h=1 ##

# Load data
sl.path<-system.file("extdata/HN_slovenia",package="npphen")
sl_rasters<-list.files(path=sl.path, pattern=glob2rx("slovenia*.tif"), full.names=TRUE)
Slovenia_rasters<-stack(sl_rasters)
sl_dates<-read.csv(system.file("extdata/date_tables/Slovenia_dates.csv", package="npphen"))
Slovenia_dates <- as.Date(sl_dates$date, format='%d/%m/%Y')

# Making the LSP raster, n bands = 23

library(snow)

# Define the number of cores to be use. In this example we use 1
nc1<-1

PhenMap(s=Slovenia_rasters,dates=Slovenia_dates,h=1,nGS=23, nCluster=nc1,
outname="phen_slov.tif", format="GTiff", datatype="FLT4S",rge=c(0,10000))
map1<-raster("phen_slov.tif")
plot(map1)

## Testing South Hemisphere data. Raster data from Chile (EVI index), h=2 ##

# Load data
ay.path<-system.file("extdata/HS_aysen",package="npphen")
ayrasters<-list.files(path=ay.path, pattern=glob2rx("aysen*.tif"), full.names=TRUE)
Aysen_rasters<-stack(ayrasters)
ay_dates<-read.csv(system.file("extdata/date_tables/Aysen_dates.csv", package="npphen"))
Aysen_dates <- as.Date(ay_dates$date, format='%d/%m/%Y')

# Making the LSP raster, n bands = 23
# Define the number of cores to be use. In this example we use 1
nc1<-1

PhenMap(s= Aysen_rasters,dates=Aysen_dates,h=2,nGS=23, nCluster=nc1,
outname="phen_aysen.tif", format="GTiff", datatype="FLT4S",rge=c(0,10000))
map2<-raster("phen_aysen.tif")
plot(map2)
## End(No test)



