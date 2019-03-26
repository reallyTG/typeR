library(GeNetIt)


### Name: graph.statistics
### Title: Point sample and statistics for edges (lines)
### Aliases: graph.statistics

### ** Examples

## Not run: 
##D library(sp)
##D library(spdep)
##D library(raster)
##D   data(rasters)
##D   data(ralu.site)
##D 
##D xvars <- stack(rasters)
##D 
##D dist.graph <- knn.graph(ralu.site, row.names = ralu.site@data[,"SiteName"], 
##D                         max.dist = 1500)
##D   str(dist.graph@data)
##D   
##D skew <- function(x, na.rm = TRUE) {  
##D           if (na.rm) x <- x[!is.na(x)]
##D           sum( (x - mean(x)) ^ 3) / ( length(x) * sd(x) ^ 3 )  
##D 		}
##D 		
##D stats <- graph.statistics(dist.graph, r = xvars, d=30, 
##D             stats = c("min", "median", "max", "var", "skew"),
##D             sp = FALSE) 
##D 			
##D dist.graph@data <- data.frame(dist.graph@data, stats)
##D   str(dist.graph@data)
## End(Not run)




