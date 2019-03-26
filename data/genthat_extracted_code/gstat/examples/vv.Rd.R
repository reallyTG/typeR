library(gstat)


### Name: vv
### Title: Precomputed variogram for PM10 in data set air
### Aliases: vv

### ** Examples

## Not run: 
##D # obtained by:
##D library(spacetime)
##D library(gstat)
##D data(air)
##D 
##D if (!exists("rural"))
##D 	rural = STFDF(stations, dates, data.frame(PM10 = as.vector(air)))
##D rr = rural[,"2005::2010"]
##D unsel = which(apply(as(rr, "xts"), 2, function(x) all(is.na(x))))
##D r5to10 = rr[-unsel,]
##D vv = variogram(PM10~1, r5to10, width=20, cutoff = 200, tlags=0:5)
## End(Not run)



