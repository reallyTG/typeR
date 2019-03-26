library(oce)


### Name: oceCRS
### Title: Coordinate Reference System strings for some oceans
### Aliases: oceCRS

### ** Examples

## Not run: 
##D library(oce)
##D data(coastlineWorld)
##D par(mar=c(2, 2, 1, 1))
##D plot(coastlineWorld, proj=oceCRS("Atlantic"), span=12000)
##D plot(coastlineWorld, proj=oceCRS("North Atlantic"), span=8000)
##D plot(coastlineWorld, proj=oceCRS("South Atlantic"), span=8000)
##D plot(coastlineWorld, proj=oceCRS("Arctic"), span=4000)
##D plot(coastlineWorld, proj=oceCRS("Antarctic"), span=10000)
##D # Avoid ugly horizontal lines, an artifact of longitude shifting.
##D # Note: we cannot fill the land once we shift, either.
##D pacific <- coastlineCut(coastlineWorld, -180)
##D plot(pacific, proj=oceCRS("Pacific"), span=15000, col=NULL)
##D plot(pacific, proj=oceCRS("North Pacific"), span=12000, col=NULL)
##D plot(pacific, proj=oceCRS("South Pacific"), span=12000, col=NULL)
## End(Not run)



