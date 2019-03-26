library(raster)


### Name: movingFun
### Title: Moving functions
### Aliases: movingFun
### Keywords: spatial

### ** Examples

movingFun(1:12, 3, mean)
movingFun(1:12, 3, mean, 'to')
movingFun(1:12, 3, mean, 'from')
movingFun(1:12, 3, mean, circular=TRUE)

v <- c(0,1,2,3,3,3,3,4,4,4,5,5,6,7,7,8,9,NA)
movingFun(v, n=5)
movingFun(v, n=5, na.rm=TRUE)



