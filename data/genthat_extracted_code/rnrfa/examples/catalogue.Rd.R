library(rnrfa)


### Name: catalogue
### Title: List of stations from UK NRFA
### Aliases: catalogue

### ** Examples

## Not run: 
##D   # Retrieve all the stations in the network
##D   x <- catalogue()
##D 
##D   # Define a bounding box:
##D   bbox <- list(lonMin=-3.82, lonMax=-3.63, latMin=52.43, latMax=52.52)
##D   # Get stations within the bounding box
##D   x <- catalogue(bbox)
##D 
##D   # Get stations based on minimum number of recording years
##D   x <- catalogue(minRec=30)
## End(Not run)




