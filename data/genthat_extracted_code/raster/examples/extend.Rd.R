library(raster)


### Name: extend
### Title: Extend
### Aliases: extend extend,Raster-method extend,Extent-method
### Keywords: spatial

### ** Examples

r <- raster(xmn=-150, xmx=-120, ymx=60, ymn=30, ncol=36, nrow=18)
r[] <- 1:ncell(r)
e <- extent(-180, 0, 0, 90)
re <- extend(r, e)

# extend with a number of rows and columns (at each side)
re2 <- extend(r, c(2,10))

# Extent object
e <- extent(r)
e
extend(e, 10)
extend(e, 10, -10, 0, 20)
e + 10
e * 2



