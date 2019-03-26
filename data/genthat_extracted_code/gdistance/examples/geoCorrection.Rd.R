library(gdistance)


### Name: geoCorrection
### Title: Geographic Correction
### Aliases: geoCorrection geoCorrection,TransitionLayer,character-method
###   geoCorrection,TransitionLayer,missing-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=36,nrow=18)
r <- setValues(r,rep(1,times=ncell(r)))
tr <- transition(r, mean, directions=8)

#directly
tr1 <- geoCorrection(tr, type="c", multpl=FALSE)

#the same, but with a separate correction matrix
trCorr <- geoCorrection(tr, type="c", multpl=TRUE)
tr2 <- tr * trCorr



