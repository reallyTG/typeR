library(dataRetrieval)


### Name: readNGWMNdata
### Title: import data from the National Groundwater Monitoring Network
###   <URL: http://cida.usgs.gov/ngwmn/>.
### Aliases: readNGWMNdata

### ** Examples

## Not run: 
##D #one site
##D site <- "USGS.430427089284901"
##D oneSite <- readNGWMNdata(siteNumbers = site, service = "observation")
##D 
##D #multiple sites
##D sites <- c("USGS.272838082142201","USGS.404159100494601", "USGS.401216080362703")
##D multiSiteData <- readNGWMNdata(siteNumbers = sites, service = "observation")
##D attributes(multiSiteData)
##D 
##D #non-USGS site
##D #accepts colon or period between agency and ID
##D site <- "MBMG:702934"
##D data <- readNGWMNdata(siteNumbers = site, service = "featureOfInterest")
##D 
##D #site with no data returns empty data frame
##D noDataSite <- "UTGS.401544112060301"
##D noDataSite <- readNGWMNdata(siteNumbers = noDataSite, service = "observation")
##D 
##D #bounding box
##D bboxSites <- readNGWMNdata(service = "featureOfInterest", bbox = c(30, -102, 31, 99))
##D #retrieve  sites.  Set asDateTime to false since one site has an invalid date
##D bboxData <- readNGWMNdata(service = "observation", siteNumbers = bboxSites$site[1:3], 
##D asDateTime = FALSE)
## End(Not run)




