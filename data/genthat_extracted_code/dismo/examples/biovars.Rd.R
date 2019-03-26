library(dismo)


### Name: biovars
### Title: bioclimatic variables
### Aliases: biovars biovars,matrix,matrix,matrix-method
###   biovars,Raster,Raster,Raster-method
###   biovars,vector,vector,vector-method
### Keywords: spatial

### ** Examples

tmin <- c(10,12,14,16,18,20,22,21,19,17,15,12)
tmax <- tmin + 5
prec <- c(0,2,10,30,80,160,80,20,40,60,20,0)
biovars(prec, tmin, tmax)

tmn = tmx = prc = brick(nrow=1, ncol=1)
tmn <- setValues(tmn, t(matrix(c(10,12,14,16,18,20,22,21,19,17,15,12))))
tmx <- tmn + 5
prc <- setValues(prc, t(matrix(c(0,2,10,30,80,160,80,20,40,60,20,0))))
b <- biovars(prc, tmn, tmx)
as.matrix(b)



