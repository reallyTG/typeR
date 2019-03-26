library(DMMF)


### Name: SinkFill
### Title: Sinkfill algorithm based on Wang and Liu (2006)
### Aliases: SinkFill

### ** Examples

## Not run: 
##D ## Load example data for test running SinkFill function
##D data(Potato.Convex)
##D attach(Potato.Convex)
##D ## Run SinkFill function with original DEM which has internal sinks.
##D DEM_with_sink <- s.map$DEM_original
##D DEM_sinkfilled <- SinkFill( DEM_with_sink )
##D DEM_nosink <- DEM_sinkfilled$nosink
##D partitions <- DEM_sinkfilled$partition
##D ## Check maps
##D par(mfrow=c(2,2))
##D plot(DEM_with_sink)
##D plot(DEM_nosink)
##D plot(DEM_with_sink - DEM_nosink)
##D plot(partitions)
## End(Not run)



