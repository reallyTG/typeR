library(raster)


### Name: stackSave
### Title: Save or open a RasterStack file
### Aliases: stackSave stackOpen
### Keywords: spatial

### ** Examples

file <- system.file("external/test.grd", package="raster")
s <- stack(c(file, file))
s <- stackSave(s, "mystack")
# note that filename adds an extension .stk to a stackfile  
## Not run: 
##D s2 <- stackOpen("mystack.stk")
##D s2
## End(Not run)



