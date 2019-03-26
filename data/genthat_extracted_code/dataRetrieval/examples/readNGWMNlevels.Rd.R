library(dataRetrieval)


### Name: readNGWMNlevels
### Title: Retrieve groundwater levels from the National Ground Water
###   Monitoring Network <URL: http://cida.usgs.gov/ngwmn/>.
### Aliases: readNGWMNlevels

### ** Examples

## Not run: 
##D #one site
##D site <- "USGS.430427089284901"
##D oneSite <- readNGWMNlevels(siteNumbers = site)
##D 
##D #multiple sites
##D sites <- c("USGS:272838082142201","USGS:404159100494601", "USGS:401216080362703")
##D multiSiteData <- readNGWMNlevels(sites)
##D 
##D #non-USGS site
##D site <- "MBMG.892195"
##D data <- readNGWMNlevels(siteNumbers = site, asDateTime = FALSE)
##D 
##D #site with no data returns empty data frame
##D noDataSite <- "UTGS.401544112060301"
##D noDataSite <- readNGWMNlevels(siteNumbers = noDataSite)
## End(Not run)



