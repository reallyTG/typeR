library(unmarked)


### Name: cruz
### Title: Landscape data for Santa Cruz Island
### Aliases: cruz
### Keywords: datasets

### ** Examples

data(cruz)
str(cruz)

levelplot(elevation ~ x + y, cruz, aspect="iso",
    col.regions=terrain.colors(100))

if(require(raster)) {
elev <- rasterFromXYZ(cruz[,1:3],
     crs="+proj=utm +zone=11 +ellps=GRS80 +datum=NAD83 +units=m +no_defs")
elev
plot(elev)
}






