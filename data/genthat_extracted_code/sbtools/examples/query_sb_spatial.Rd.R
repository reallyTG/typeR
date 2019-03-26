library(sbtools)


### Name: query_sb_spatial
### Title: Query SB based on spatial extent
### Aliases: query_sb_spatial

### ** Examples


#specify the latitude and longitude points to define the bounding box range. 
# This is simply bottom left and top right points
query_sb_spatial(long=c(-104.4, -95.1), lat=c(37.5, 41.0), limit=3)

#use a pre-formatted WKT polygon to grab data
query_sb_spatial(bb_wkt="POLYGON((-104.4 41.0,-95.1 41.0,-95.1 37.5,-104.4 37.5,-104.4 41.0))", 
	                limit=3)

## Not run: 
##D ###Use the bounding box of an sp object 
##D #grab an sp object from a pre-determined ScienceBase Item
##D layer = item_get_wfs('55e372b9e4b05561fa208212')
##D 
##D #get items in that BB
##D query_sb_spatial(layer)
## End(Not run)




