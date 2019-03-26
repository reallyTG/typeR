library(rasterList)


### Name: stack,RasterList-method
### Title: Creates a 'RasterStack-class' object from a 'RasterList-class'
### Aliases: stack stack,RasterList-method

### ** Examples


f <- system.file("external/test.grd", package="raster")

## Creates a simple generic RasterList

rl <- rasterList(f) 

list <- as.list(as.vector(rl))
list <- lapply(X=list,FUN=function (x) {c(x,x+10,x+15)}) 

rl <- rasterList(rl,list=list,object.name="test")

ss <- stack(rl)

il <- 8331
list[[il]] <- numeric(0)
rla <- rasterList(rl,list=list,object.name="test2")
sa <- stack(rla) 



