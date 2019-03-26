library(geospt)


### Name: COSha10map
### Title: Map of total soil carbon stock (t/ha) at 0-10 cm depth
### Aliases: COSha10map
### Keywords: datasets

### ** Examples

data(COSha10map)
data(lalib)
summary(COSha10map)
l1 = list("sp.polygons", lalib)
spplot(COSha10map, "var1.pred", main="Soil carbon stock (t/ha) at 0-10 cm depth", 
    col.regions=bpy.colors(100), scales = list(draw =TRUE), xlab ="East (m)", 
    ylab = "North (m)", sp.layout=list(l1))



