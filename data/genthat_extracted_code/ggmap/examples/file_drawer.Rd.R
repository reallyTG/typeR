library(ggmap)


### Name: file_drawer
### Title: Manage the ggmap file drawer.
### Aliases: file_drawer
### Keywords: internal

### ** Examples


## Not run: 
##D  if server is unresponsive, R check will fail
##D 
##D file_drawer()
##D dir(file_drawer())
##D 
##D # The first time you run this, the tiles are downloaded from the server
##D map <- get_stamenmap()
##D # The second time, the local cache is used so it's much faster
##D map <- get_stamenmap()
##D 
##D dir(file_drawer())
##D 
## End(Not run)




