library(MazamaSpatialUtils)


### Name: simplify
### Title: Simplify SpatialPolygonsDataFrame
### Aliases: simplify

### ** Examples

## Not run: 
##D FR <- subset(SimpleCountries, countryCode == 'FR')
##D par(mfrow=c(3,3), mar=c(1,1,3,1))
##D for (i in 9:1) {
##D   keep <- 0.1 * i
##D   plot(simplify(FR, keep), main=paste0("keep = ",keep))
##D }
##D layout(1)
##D par(mar = c(5,4,4,2)+.1)
## End(Not run)



