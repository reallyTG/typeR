library(geoknife)


### Name: webgeom
### Title: create webgeom object
### Aliases: webgeom webgeom,missing-method webgeom,ANY-method

### ** Examples

wg <- webgeom(geom = "sample:CONUS_states", 
 attribute = "STATE",
 values = "New Hampshire")
#-- use available state datasets:
wg <- webgeom('state::New Hampshire')
wg <- webgeom('state::New Hampshire,Wisconsin,Alabama')
#-- use available Level III Ecoregion datasets:
wg <- webgeom('ecoregion::Colorado Plateaus,Driftless Area')
#-- use available simplified HUC8s:
wg <- webgeom('HUC8::09020306,14060009')
wg <- webgeom()

## Not run: 
##D ## Steps to find data on Howard County in Texas:
##D #1) locate the \code{geom} for counties by looking at the options for geoms
##D query(webgeom(), 'geoms') # discover sample:Counties
##D #2) locate the \code{attribute} for county names by looking at the options for attributes
##D query(webgeom(geom='sample:Counties'), 'attributes') # discover FIPS
##D #3) find the appropriate fip code for the county:
##D howard.fips <- maps::county.fips %>% 
##D    dplyr::filter(polyname == 'texas,howard') %>% .$fips %>% as.character
##D #4) create a webgeom for the Howard County in Texas
##D stencil <- webgeom(geom='sample:Counties', attribute='FIPS', values=howard.fips)
##D #5) get data for Howard County
##D fabric <- webdata(url = 'https://cida.usgs.gov/thredds/dodsC/stageiv_combined', 
##D variables = "Total_precipitation_surface_1_Hour_Accumulation", 
##D times = c(as.POSIXct("2016-06-06 05:00:00"), 
##D           as.POSIXct("2016-06-07 05:00:00")))
##D job <- geoknife(stencil, fabric, wait = TRUE)
##D precipData <- result(job)
##D head(precipData)
## End(Not run)



