library(rnoaa)


### Name: swdi
### Title: Get NOAA data for the severe weather data inventory (swdi).
### Aliases: swdi

### ** Examples

## Not run: 
##D # Search for nx3tvs data from 5 May 2006 to 6 May 2006
##D swdi(dataset='nx3tvs', startdate='20060505', enddate='20060506')
##D 
##D # Get all 'nx3tvs' within 15 miles of latitude = 32.7 and longitude = -102.0
##D swdi(dataset='nx3tvs', startdate='20060506', enddate='20060507',
##D radius=15, center=c(-102.0,32.7))
##D 
##D # use an id
##D swdi(dataset='warn', startdate='20060506', enddate='20060507', id=533623)
##D 
##D # Get all 'plsr' within the bounding box (-91,30,-90,31)
##D swdi(dataset='plsr', startdate='20060505', enddate='20060510',
##D bbox=c(-91,30,-90,31))
##D 
##D # Get all 'nx3tvs' within the tile -102.1/32.6 (-102.15,32.55,-102.25,32.65)
##D swdi(dataset='nx3tvs', startdate='20060506', enddate='20060507',
##D tile=c(-102.12,32.62))
##D 
##D # Counts
##D ## Note: stat='count' will only return metadata, nothing in the data or shape slots
##D ## Note: stat='tilesum:...' returns counts in the data slot for each date for that tile,
##D ##   and shape data
##D ## Get number of 'nx3tvs' within 15 miles of latitude = 32.7 and longitude = -102.0
##D swdi(dataset='nx3tvs', startdate='20060505', enddate='20060516', radius=15,
##D center=c(-102.0,32.7), stat='count')
##D 
##D ## Get daily count nx3tvs features on .1 degree grid centered at latitude = 32.7
##D ## and longitude = -102.0
##D swdi(dataset='nx3tvs', startdate='20060505', enddate='20090516',
##D stat='tilesum:-102.0,32.7')
##D 
##D # CSV format
##D swdi(dataset='nx3tvs', startdate='20060505', enddate='20060506', format='csv')
##D 
##D # SHP format
##D swdi(dataset='nx3tvs', startdate='20060505', enddate='20060506', format='shp',
##D    filepath='myfile')
##D 
##D # KMZ format
##D swdi(dataset='nx3tvs', startdate='20060505', enddate='20060506', format='kmz',
##D    radius=15, filepath='myfile.kmz')
##D 
##D # csv output to SpatialPointsDataFrame
##D res <- swdi(dataset='nx3tvs', startdate='20060505', enddate='20060506', format="csv")
##D library('sp')
##D coordinates(res$data) <- ~lon + lat
##D res$data
##D class(res$data)
## End(Not run)



