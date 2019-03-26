library(rsMove)


### Name: predictResources
### Title: predictResources
### Aliases: predictResources

### ** Examples

## Not run: 
##D 
##D  require(raster)
##D 
##D  # read remote sensing data
##D  file <- list.files(system.file('extdata', '', package="rsMove"), 'ndvi.tif', full.names=TRUE)
##D  r.stk <- stack(file)
##D 
##D  # read movement data
##D  data(shortMove)
##D 
##D  # observation time
##D  obs.time <- strptime(paste0(shortMove@data$date, ' ', shortMove@data$time),
##D  format="%Y/%m/%d %H:%M:%S")
##D 
##D  # remove redundant samples
##D  shortMove <- moveReduce(shortMove, r.stk, obs.time)$points
##D 
##D  # retrieve remote sensing data for samples
##D  rsQuery <- extract(r.stk, shortMove)
##D 
##D  # identify unique sample regions
##D  label <- labelSample(shortMove, r.stk, agg.radius=30)
##D 
##D  # select background samples
##D  bSamples <- backSample(shortMove, r.stk, label, sampling.method='pca')
##D 
##D  # derive model predictions
##D  out <- predictResources(rsQuery, bSamples@data, label, env.data=r.stk)
##D 
## End(Not run)



