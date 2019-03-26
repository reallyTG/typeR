library(sbtools)


### Name: query_items
### Title: Query SB for items using generic query parameters
### Aliases: query_items

### ** Examples

## Not run: 
##D # Basic query
##D library("httr")
##D res <- query_items(list(s = "Search", q = "water", format = "json"))
##D httr::content(res)
##D 
##D # Paging
##D ## max - number of results
##D res <- query_items(list(s = "Search", q = "water", format = "json", max = 2))
##D length(httr::content(res)$items)
##D res <- query_items(list(s = "Search", q = "water", format = "json", max = 30))
##D length(httr::content(res)$items)
##D ## offset - start at certain record
##D res <- query_items(list(s = "Search", q = "water", format = "json", 
##D max = 30, offset = 10))
##D httr::content(res)
##D ## links - use links given in output for subsequent queries
##D httr::content(httr::GET(
##D 		content(res)$nextlink$url
##D ))
##D 
##D # Return only certain fields
##D res <- query_items(list(s = "Search", q = "water", format = "json", fields = 'title'))
##D httr::content(res)$items[[1]]
##D 
##D # Search a folder ID
##D res <- query_items(list(s = "Search", q = "water", format = "json", 
##D folderId = '504216b9e4b04b508bfd337d'))
##D httr::content(res)$items
##D 
##D # Filter by ancestor
##D query_items(list(s = "Search", ancestors = "4f831626e4b0e84f6086809b", format = "json"))
##D 
##D # Filter by tags
##D content(query_items(list(s = "Search", tags = "distribution", format = "json")))
##D 
##D # Filter by browse category
##D content(query_items(list(s = "Search", browseCategory = "Image", format = "json")))
##D 
##D # Filter by browse type
##D content(query_items(list(s = "Search", browseType = "Collection", format = "json")))
##D 
##D # Filter by WKT geometry string
##D wkt1 <- "POLYGON((-104.4 41.0,-95.1 41.0,-95.1 37.5,-104.4 37.5,-104.4 41.0))"
##D wkt2 <- "POLYGON((-104.4 38.3,-95.2 38.3,-95.2 33.7,-104.4 34.0,-104.4 38.3))"
##D content(query_items(list(s = "Search", spatialQuery = wkt1, format = "json")))
##D content(query_items(list(s = "Search", spatialQuery = wkt1, 
##D 		spatialQuery = wkt2, format = "json")))
##D 
##D # Project status
##D content(query_items(list(s = "Search", projectStatus = "Active", format = "json")))
##D 
##D # Date range
##D query_items(list(s = "Search", 
##D 		dateRange = '{"dateType":"Collected","choice":"year"}', format = "json"))
##D query_items(list(s = "Search", 
##D 		dateRange = '{"dateType":"lastUpdated","choice":"month"}', format = "json"))
##D query_items(list(s = "Search", 
##D 		dateRange = 
##D 		'{"dateType":"Release","choice":"range","start":"2014-09-01","end":"2015-09-01"}', 
##D 		format = "json"))
##D 
##D # Extent query
##D ## just a alphanumeric code
##D content(query_items(list(s = "Search", extentQuery = '2873462', format = "json")))
##D ## with buffering, intersect
##D content(query_items(list(s = "Search", extentQuery = '{"extent":2873462,
##D 		"relation":"intersects","buffer":"5"}', format = "json")))
##D ## with buffering, within
##D content(query_items(list(s = "Search", extentQuery = '{"extent":2873462,
##D 		"relation":"within","buffer":"5"}', format = "json")))
##D ## with buffering, within
##D content(query_items(list(s = "Search", extentQuery = '{"extent":2873462,
##D 		"relation":"disjoint","buffer":"5"}', format = "json")))
##D 		
##D # Lucene query
##D ## note, you have to pass the q parameter if you pass the lq parameter
##D content(query_items(list(s = "Search", q = "", lq = '"sage OR grouse"')))
## End(Not run)



