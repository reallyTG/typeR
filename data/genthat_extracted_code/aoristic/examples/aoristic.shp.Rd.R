library(aoristic)


### Name: aoristic.shp
### Title: aoristic graph by shapefile boundary
### Aliases: aoristic.shp

### ** Examples

## No test: 
data(aoristic)
data.spdf <- aoristic.spdf(data=arlington,
   DateTimeFrom="DateTimeFrom", DateTimeTo="DateTimeTo",
   lon="lon", lat="lat")
aoristic.shp(spdf=data.spdf, area.shp=CouncilDistrict)
## End(No test)



