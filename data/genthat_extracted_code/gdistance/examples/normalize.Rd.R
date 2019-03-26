library(gdistance)


### Name: normalize
### Title: normalize
### Aliases: normalize normalize,TransitionLayer-method
### Keywords: methods spatial

### ** Examples

r <- raster(ncol=36,nrow=18)
r <- setValues(r,rep(1,times=ncell(r)))
tr <- transition(r, mean, directions=8)

tr1 <- normalize(tr)
tr2 <- normalize(tr, method="symm")



