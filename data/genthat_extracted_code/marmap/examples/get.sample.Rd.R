library(marmap)


### Name: get.sample
### Title: Get sample data by clicking on a map
### Aliases: get.sample

### ** Examples

## Not run: 
##D # load metallo sampling data and add a third field containing a specimen ID
##D data(metallo)
##D metallo$id <- factor(paste("Metallo",1:38))
##D 
##D # load NW Atlantic data, convert to class bathy, and plot
##D data(nw.atlantic)
##D atl <- as.bathy(nw.atlantic)
##D plot(atl, deep=-8000, shallow=0, step=1000, col="grey")
##D 
##D # once the map is plotted, use get.sample to get sampling info!
##D get.sample(atl, metallo, 1, 2)
##D # click twice
## End(Not run)



