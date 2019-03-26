library(bReeze)


### Name: map.plot
### Title: Plot map or satellite image
### Aliases: map.plot map
### Keywords: methods

### ** Examples

## Not run: 
##D # load and prepare data
##D data("winddata", package="bReeze")
##D set1 <- set(height=40, v.avg=winddata[,2])
##D ts <- timestamp(winddata[,1])
##D neubuerg <- mast(timestamp=ts, set1, loc=c(49.8909,11.4017))
##D 
##D # plot satellite image
##D map.plot(neubuerg)
##D 
##D # plot terrain map
##D map.plot(neubuerg, type="terrain")
##D 
##D # change zoom level
##D map.plot(neubuerg, zoom=1)
##D map.plot(neubuerg, zoom=18)
##D 
##D # change symbol (and label) 
##D map.plot(neubuerg, col="white", pch="+", cex=2)
##D 
##D # change label
##D map.plot(neubuerg, col.lab=3, cex.lab=1.5)
##D map.plot(neubuerg, pos.lab=1)
##D map.plot(neubuerg, label="Site #247 - Neubuerg")  # custom label
##D map.plot(neubuerg, label=NA)  # no label
## End(Not run)



