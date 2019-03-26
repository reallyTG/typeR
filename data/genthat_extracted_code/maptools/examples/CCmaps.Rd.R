library(maptools)


### Name: CCmaps
### Title: Conditioned choropleth maps
### Aliases: CCmaps
### Keywords: spatial

### ** Examples

nc.sids <- readShapeSpatial(system.file("shapes/sids.shp",
 package="maptools")[1], IDvar="FIPSNO",
 proj4string=CRS("+proj=longlat +ellps=clrk66"))
nc.sids$ft.SID74 <- sqrt(1000)*(sqrt(nc.sids$SID74/nc.sids$BIR74) +
 sqrt((nc.sids$SID74+1)/nc.sids$BIR74))
nc.sids$ft.NWBIR74 <- sqrt(1000)*(sqrt(nc.sids$NWBIR74/nc.sids$BIR74) +
 sqrt((nc.sids$NWBIR74+1)/nc.sids$BIR74))
library(lattice)
sh_nw4 <- equal.count(nc.sids$ft.NWBIR74, number=4, overlap=1/5)
CCmaps(nc.sids, "ft.SID74", list("Nonwhite_births"=sh_nw4),
 col.regions=colorRampPalette(c("yellow1", "brown3"))(20),
 main="Transformed SIDS rates 1974-8")



