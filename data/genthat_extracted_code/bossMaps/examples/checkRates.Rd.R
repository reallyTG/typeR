library(bossMaps)


### Name: checkRates
### Title: Evaluate whether potential curve parameters are feasible given
###   the range and domain geometry.
### Aliases: checkRates

### ** Examples

data(Beamys_hindei_range)
# Generate domain
 domain=raster::raster(xmn=-180, xmx=180, ymn=-90, ymx=90,
 crs="+proj=longlat +ellps=WGS84 +towgs84=0,0,0,0,0,0,0 +no_defs",
 resolution=.1, vals=NULL)
 # registerDoParallel(2) #optionally use to speed up calculation
 # Calculate distance to range
 rdist=rangeDist(range=Beamys_hindei_range,domain=domain,
                 domainkm=1000,mask=FALSE,fact=2,verbose=FALSE)
 dpar=checkRates(rdist,plot=FALSE)
 head(dpar)



