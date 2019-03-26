library(unmarked)


### Name: Switzerland
### Title: Swiss landscape data
### Aliases: Switzerland
### Keywords: datasets

### ** Examples

data(Switzerland)
str(Switzerland)

levelplot(elevation ~ x + y, Switzerland, aspect="iso",
    col.regions=terrain.colors(100))

## Not run: 
##D library(raster)
##D el.r <- rasterFromXYZ(Switzerland[,c("x","y","elevation")], crs =
##D "+proj=somerc +lat_0=46.95240555555556 +lon_0=7.439583333333333
##D +k_0=1 +x_0=600000 +y_0=200000 +ellps=bessel
##D +towgs84=674.374,15.056,405.346,0,0,0,0 +units=m +no_defs")
##D plot(el.r)
##D spplot(el.r)
## End(Not run)




