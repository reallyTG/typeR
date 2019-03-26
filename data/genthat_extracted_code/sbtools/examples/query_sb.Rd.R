library(sbtools)


### Name: query_sb
### Title: Query SB for items using generic query parameters
### Aliases: query_sb

### ** Examples

## Not run: 
##D query_sb(list(q = "water"))
##D 
##D # Search by project status
##D query_sb(list(projectStatus = "Active"))
##D 
##D # Search a folder ID
##D query_sb(list(q = "water", folderId = '504216b9e4b04b508bfd337d'))
##D 
##D # Filter by ancestor
##D query_sb(list(ancestors = "4f831626e4b0e84f6086809b"))
##D 
##D # Filter by tags
##D query_sb(list(tags = "distribution"))
##D 
##D # Filter by browse category
##D query_sb(list(browseCategory = "Image"))
##D 
##D # Filter by browse type
##D query_sb(list(browseType = "Map Service"))
##D 
##D # Filter by WKT geometry string
##D wkt1 <- "POLYGON((-104.4 41.0,-95.1 41.0,-95.1 37.5,-104.4 37.5,-104.4 41.0))"
##D wkt2 <- "POLYGON((-104.4 38.3,-95.2 38.3,-95.2 33.7,-104.4 34.0,-104.4 38.3))"
##D query_sb(list(spatialQuery = wkt1))
##D query_sb(list(spatialQuery = wkt1, spatialQuery = wkt2))
##D 
##D # Date range
##D query_sb(list(dateRange = '{"dateType":"Collected","choice":"year"}'))
##D query_sb(list(dateRange = '{"dateType":"lastUpdated","choice":"month"}'))
##D query_sb(list(dateRange = 
##D 		'{"dateType":"Release","choice":"range","start":"2014-09-01","end":"2015-09-01"}'))
## End(Not run)





