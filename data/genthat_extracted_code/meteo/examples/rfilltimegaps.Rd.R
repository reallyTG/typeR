library(meteo)


### Name: rfilltimegaps
### Title: Disaggregation in the time dimension through the use of splines
###   for each pixel
### Aliases: rfilltimegaps

### ** Examples

  data(nlmodis20110704)
  data(nlmodis20110712)

  
  # fill spatial gaps
  library(raster)
  NLpol <- as(extent(5, 6, 51.5, 52), 'SpatialPolygons')
  NLpol@proj4string <- nlmodis20110704@proj4string
  nlmodis20110704 <- rfillspgaps(nlmodis20110704,NLpol)
  nlmodis20110712 <- rfillspgaps(nlmodis20110712,NLpol)
  
  nlmodis20110704 <- as(nlmodis20110704,"SpatialPixelsDataFrame")
  names(nlmodis20110704)='m1'
  nlmodis20110712 <- as(nlmodis20110712,"SpatialPixelsDataFrame")
  names(nlmodis20110712)='m2'
  
  nlmodis20110704@data <- cbind(nlmodis20110704@data, nlmodis20110712@data)
  
  df<-reshape(nlmodis20110704@data , varying=list(1:2), v.names="modis",direction="long", 
            times=as.Date(c('2011-07-04','2011-07-12')), ids=1:dim(nlmodis20110704)[1])
  
  library(spacetime)
  stMODIS<- STFDF(as( nlmodis20110704, "SpatialPixels"), 
                  time= as.Date(c('2011-07-04','2011-07-12')), 
                  data.frame(modis=df[,'modis']))
  
  # stplot(stMODIS, col.regions=bpy.colors())
  stMODIS <- rfilltimegaps(stMODIS)
  # stplot(stMODIS, col.regions=bpy.colors())



