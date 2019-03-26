library(gapfill)


### Name: Gapfill
### Title: Main Function for Gap-Filling
### Aliases: Gapfill gapfill gap-fill Gap-fill

### ** Examples

## Not run: 
##D out <- Gapfill(ndvi, clipRange = c(0, 1))
##D 
##D ## look at input and output
##D str(ndvi)
##D str(out)
##D Image(ndvi)
##D Image(out$fill)
##D 
##D ## run on 2 cores in parallel
##D if(require(doParallel)){
##D   registerDoParallel(2)
##D   out <- Gapfill(ndvi, dopar = TRUE)
##D }
##D 
##D ## return also the prediction interval
##D out <- Gapfill(ndvi, nPredict = 3, predictionInterval = TRUE)
##D 
##D ## dimension has changed according to 'nPredict = 3'
##D dim(out$fill)
##D 
##D ## clip values outside the valid parameter space [0,1].
##D out$fill[out$fill < 0] <- 0
##D out$fill[out$fill > 1] <- 1
##D 
##D ## images of the output:
##D ## predicted NDVI
##D Image(out$fill[,,,,1])
##D ## lower bound of the prediction interval
##D Image(out$fill[,,,,2])
##D ## upper bound of the prediction interval
##D Image(out$fill[,,,,3])
##D ## prediction interval length
##D Image(out$fill[,,,,3] - out$fill[,,,,2])
##D 
## End(Not run)



