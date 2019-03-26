library(icosa)


### Name: resample,Raster,trigrid-method
### Title: Resampling of data to a trigrid or a hexagrid object.
### Aliases: Raster-trigrid-resample-method
###   facelayer-trigrid-resample-method resample,Raster,trigrid-method
###   resample,facelayer,trigrid-method

### ** Examples

	g <- trigrid(c(4,4))
	fl <- facelayer(g)
	fl@values<-rnorm(length(fl))
	h <- trigrid(4)
	res <- resample(fl, h)
	fl2<-facelayer(h)
	fl2@values[] <- res




