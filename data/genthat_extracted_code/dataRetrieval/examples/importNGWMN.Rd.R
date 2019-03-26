library(dataRetrieval)


### Name: importNGWMN
### Title: Function to return data from the National Ground Water
###   Monitoring Network waterML2 format
### Aliases: importNGWMN

### ** Examples

## Not run: 
##D obs_url <- paste("http://cida.usgs.gov/ngwmn_cache/sos?request=GetObservation",
##D "service=SOS","version=2.0.0",
##D "observedProperty=urn:ogc:def:property:OGC:GroundWaterLevel",
##D "responseFormat=text/xml",
##D "featureOfInterest=VW_GWDP_GEOSERVER.USGS.403836085374401",sep="&")
##D data <- importNGWMN(obs_url)
##D 
##D obs_url <- paste("http://cida.usgs.gov/ngwmn_cache/sos?request=GetObservation",
##D "service=SOS","version=2.0.0",
##D "observedProperty=urn:ogc:def:property:OGC:GroundWaterLevel",
##D "responseFormat=text/xml",
##D "featureOfInterest=VW_GWDP_GEOSERVER.USGS.474011117072901",sep="&")
##D data <- importNGWMN(obs_url)
## End(Not run)




