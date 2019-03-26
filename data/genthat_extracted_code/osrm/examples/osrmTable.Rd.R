library(osrm)


### Name: osrmTable
### Title: Get Travel Time Matrices Between Points
### Aliases: osrmTable

### ** Examples

## Not run: 
##D # Load data
##D data("berlin")
##D 
##D # Inputs are data frames
##D # Travel time matrix
##D distA <- osrmTable(loc = apotheke.df[1:50, c("id","lon","lat")])
##D # First 5 rows and columns
##D distA$durations[1:5,1:5]
##D 
##D # Travel time matrix with different sets of origins and destinations
##D distA2 <- osrmTable(src = apotheke.df[1:10,c("id","lon","lat")],
##D                     dst = apotheke.df[11:20,c("id","lon","lat")])
##D # First 5 rows and columns
##D distA2$durations[1:5,1:5]
##D 
##D # Inputs are SpatialPointsDataFrames
##D distA3 <- osrmTable(loc = apotheke.sp[1:10,])
##D # First 5 rows and columns
##D distA3$durations[1:5,1:5]
##D 
##D # Travel time matrix with different sets of origins and destinations
##D distA4 <- osrmTable(src = apotheke.sp[1:10,], dst = apotheke.sp[11:20,])
##D # First 5 rows and columns
##D distA4$durations[1:5,1:5]
## End(Not run)



