library(letsR)


### Name: lets.rangesize
### Title: Compute species' geographic range sizes
### Aliases: lets.rangesize

### ** Examples

## Not run: 
##D # SpatialPolygonsDataFrame & geographical
##D data(Phyllomedusa)  
##D rangesize <- lets.rangesize(x = Phyllomedusa, 
##D                             coordinates = "geographic")
##D 
##D # SpatialPolygonsDataFrame & planar
##D rangesize2 <- lets.rangesize(x = Phyllomedusa, 
##D                              coordinates = "planar")
##D 
##D # PresenceAbsence & cell
##D data(PAM)  
##D rangesize3 <- lets.rangesize(x = PAM, 
##D                              units = "cell")
##D 
##D # PresenceAbsence & squaremeter
##D rangesize4 <- lets.rangesize(x = PAM,
##D                              units = "squaremeter")
## End(Not run)





