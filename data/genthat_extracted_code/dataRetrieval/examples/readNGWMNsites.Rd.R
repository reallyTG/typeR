library(dataRetrieval)


### Name: readNGWMNsites
### Title: Retrieve site data from the National Ground Water Monitoring
###   Network <URL: http://cida.usgs.gov/ngwmn/>.
### Aliases: readNGWMNsites

### ** Examples

## Not run: 
##D #one site
##D site <- "USGS.430427089284901"
##D oneSite <- readNGWMNsites(siteNumbers = site)
##D 
##D #multiple sites
##D sites <- c("USGS:272838082142201","USGS:404159100494601", "USGS:401216080362703")
##D multiSiteInfo <- readNGWMNsites(sites)
##D 
##D #non-USGS site
##D site <- "MBMG.892195"
##D siteInfo <- readNGWMNsites(siteNumbers = site)
##D 
## End(Not run)



