library(MapGAM)


### Name: trimdata
### Title: Trim a Data Set To Map Boundaries
### Aliases: trimdata
### Keywords: misc

### ** Examples

# These examples require the "PBSmapping" and "maps" packages
if (require(maps) & require(PBSmapping)) {
data(beertweets)
dim(beertweets)

### Trim data to US base map, and plot them
basemap1 <- map("usa", fill=TRUE, col="transparent")	
dUS <- trimdata(beertweets, basemap1)	 				 
# Plot tweet locations (beer tweets in red)
points(dUS$longitude, dUS$latitude, col=dUS$beer+1, cex=0.5)		

### Trim data to Texas base map, and plot them
basemap2 <- map("state", regions="texas", fill=TRUE, col="transparent") 
dTX <- trimdata(beertweets, basemap2) 								
# Plot tweet locations (beer tweets in red)
points(dTX$longitude, dTX$latitude, col=dTX$beer+1, cex=0.5) 
}



