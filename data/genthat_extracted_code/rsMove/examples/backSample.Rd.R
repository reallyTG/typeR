library(rsMove)


### Name: backSample
### Title: backSample
### Aliases: backSample

### ** Examples

{

 require(raster)

 # read raster data
 file <- list.files(system.file('extdata', '', package="rsMove"), 'ndvi.tif', full.names=TRUE)
 r.stk <- stack(file)

 # read movement data
 data(shortMove)

 # find sample regions
 label <- labelSample(shortMove, 30, agg.radius=30, nr.pixels=2)

 # select background samples (pca)
 bSamples <- backSample(shortMove, r.stk, label, sampling.method='pca')

 # select background samples (random)
 bSamples <- backSample(shortMove, r.stk, sampling.method='random')

}



