library(openSTARS)


### Name: calcCatchmArea_assignNetID
### Title: Calculate total catchment area of a stream segment and assign a
###   network id.
### Aliases: calcCatchmArea_assignNetID
### Keywords: internal

### ** Examples

## Not run: 
##D  outlets <- dt.streams[next_str == -1, stream]
##D  netID <- 1
##D  for(i in outlets){
##D    calcCatchmArea_assignNetID(dt.streams, id = i, netID)
##D    netID <- netID + 1
##D  }
## End(Not run)



