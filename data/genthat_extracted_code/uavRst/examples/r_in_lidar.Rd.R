library(uavRst)


### Name: r_in_lidar
### Title: wraps the r.in.lidar tool
### Aliases: r_in_lidar

### ** Examples

## Not run: 
##D require(uavRst)
##D ##- Straightforward example to generate a DTM 
##D     based on the class 2 minimum returns of a LiDAR file
##D     
##D # get a las file from the Spain authorithy (29.2 MB)
##D # Source: (https://b5m.gipuzkoa.eus/url5000/es/G_22485/PUBLI&consulta=HAZLIDAR)
##D utils::download.file(url="https://b5m.gipuzkoa.eus/lidar/MT13_08_au_las.zip",
##D                            destfile="MT13_08_au_las.zip", mode = "wb")
##D unzip("MT13_08_au_las.zip",junkpaths = TRUE,overwrite = TRUE)
##D 
##D ##- extract extent for setting up GRASS region
##D ext<-lastool(lasFile =  "MT13_08_au.las")
##D ## according to the meta data 
##D #  source: https://b5m.gipuzkoa.eus/web5000/en/csw/MT13_08_au_en 
##D #  the projection is EPSG25830. NOTE it is obligate to at the zero transformation params
##D proj4 = "+proj=utm +zone=30 +ellps=GRS80 +towgs84=0,0,0,0,0,0,0 +units=m +no_defs"
##D 
##D ##- set up GRASS
##D result<-link2GI::linkGRASS7(spatial_params = c(ext[2],ext[1],ext[4],ext[3],proj4),
##D                              resolution = 5.0)
##D                              
##D ##- use the r.in.lidar tool to generate a pseudo surface model
##D r_in_lidar(input = "MT13_08_au.las",
##D            output = "dem",
##D            method = "min",
##D            resolution = 5,
##D            class_filter = 2)
##D            
##D ##- visualize it
##D raster::plot(raster::raster(rgrass7::readRAST("dem")))
##D                             
## End(Not run)



