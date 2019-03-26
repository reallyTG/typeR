library(uavRst)


### Name: lastool
### Title: simple wrapper for some LAStools functions
### Aliases: lastool

### ** Examples

## Not run: 
##D 
##D require(uavRst)
##D require(link2GI)
##D # get a las file from the Spain authorithy (29.2 MB)
##D # source: (https://b5m.gipuzkoa.eus/url5000/es/G_22485/PUBLI&consulta=HAZLIDAR)
##D utils::download.file(url="ftp://ftp.geo.euskadi.net/lidar/LIDAR_2012_ETRS89/LAS/038/522-4812.zip",
##D                            destfile="522-4812.zip",  quiet = TRUE, mode = "wb")
##D unzip("522-4812.zip",junkpaths = TRUE,overwrite = TRUE)
##D 
##D # convert from laz to las
##D lastool(tool="las2txt","522-4812.las")
##D 
##D # view it
##D head(read.table("522-4812.txt",sep = ","))
##D 
## End(Not run)



