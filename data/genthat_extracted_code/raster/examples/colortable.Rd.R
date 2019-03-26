library(raster)


### Name: colortable
### Title: colortable
### Aliases: colortable colortable<-
### Keywords: spatial

### ** Examples

r <- raster(ncol=10, nrow=10)
values(r) <- sample(0:255, ncell(r), replace=TRUE)
ctab <- sample(rainbow(256))
colortable(r) <- ctab
plot(r)
head(colortable(r)) 



