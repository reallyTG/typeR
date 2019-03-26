library(raster)


### Name: z-values
### Title: Get or set z-values
### Aliases: getZ setZ
### Keywords: spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
s <- stack(lapply(1:3, function(x) setValues(r, runif(ncell(r)))))
s <- setZ(s, as.Date('2000-1-1') + 0:2)
s
getZ(s)



