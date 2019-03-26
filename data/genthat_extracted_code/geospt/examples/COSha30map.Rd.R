library(geospt)


### Name: COSha30map
### Title: Map of total soil carbon stock (t/ha) at 0-30 cm depth
### Aliases: COSha30map
### Keywords: datasets

### ** Examples

data(COSha30map)
data(lalib)
summary(COSha30map)
l1 = list("sp.polygons", lalib)
spplot(COSha30map, "var1.pred", main="Soil carbon stock (t/ha) at 0-30 cm depth", 
    col.regions=bpy.colors(100), scales = list(draw =TRUE), xlab ="East (m)", 
    ylab = "North (m)", sp.layout=list(l1))



