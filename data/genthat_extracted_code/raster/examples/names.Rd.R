library(raster)


### Name: names
### Title: Names of raster layers
### Aliases: labels,Raster-method names names<- names,Raster-method
###   names,RasterStack-method names<-,Raster-method
### Keywords: spatial

### ** Examples

r <- raster(ncols=5, nrows=5)
r[] <- 1:ncell(r)
s <- stack(r, r, r)
nlayers(s)
names(s)
names(s) <- c('a', 'b', 'c')
names(s)[2] <- 'hello world'
names(s)
s
labels(s)



