library(GeNetIt)


### Name: area.graph.statistics
### Title: Statistics for edges (lines) based on a defined scale (area).
### Aliases: area.graph.statistics

### ** Examples

## Not run: 
##D library(sp)
##D library(spdep)
##D library(raster)
##D   data(rasters)
##D   data(ralu.site)
##D 
##D xvars <- stack(rasters[-6])
##D 
##D dist.graph <- knn.graph(ralu.site, row.names = ralu.site@data[,"SiteName"], 
##D                         max.dist = 500)
##D   str(dist.graph@data)
##D   
##D skew <- function(x, na.rm = TRUE) {  
##D           if (na.rm) x <- x[!is.na(x)]
##D           sum( (x - mean(x)) ^ 3) / ( length(x) * sd(x) ^ 3 )  
##D 		}
##D 		
##D area.graph.statistics(dist.graph[1:5,], r = xvars, s = 500, 
##D            stats = c("min", "median", "max", "var", "skew")) 
## End(Not run)




