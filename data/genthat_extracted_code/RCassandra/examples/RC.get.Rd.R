library(RCassandra)


### Name: RC.get
### Title: Functions for querying Cassandra database
### Aliases: RC.use RC.get RC.get.range RC.mget.range RC.get.range.slices
###   RC.consistency
### Keywords: interface

### ** Examples

## Not run: 
##D c <- RC.connect("cassandra-host")
##D RC.use(c, "testdb")
##D ## you will have to use cassandra-cli to create the schema for the "iris" CF
##D RC.write.table(c, "iris", iris)
##D RC.get(c, "iris", "1", c("Sepal.Length", "Species"))
##D RC.get.range(c, "iris", "1")
##D ## list of 150 data frames
##D r <- RC.get.range.slices(c, "iris")
##D ## use limit=0 to obtain all row keys without pulling any data
##D rk <- RC.get.range.slices(c, "iris", limit=0)
##D y <- RC.read.table(c, "iris")
##D y <- y[order(as.integer(row.names(y))),]
##D RC.close(c)
## End(Not run)



