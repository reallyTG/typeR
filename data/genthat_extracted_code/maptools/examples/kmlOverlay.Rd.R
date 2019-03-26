library(maptools)


### Name: kmlOverlay
### Title: Create and write KML file for PNG image overlay
### Aliases: kmlOverlay
### Keywords: spatial

### ** Examples

opt_exask <- options(example.ask=FALSE)
qk <- SpatialPointsDataFrame(quakes[, c(2:1)], quakes)
proj4string(qk) <- CRS("+proj=longlat +ellps=WGS84")
tf <- tempfile()
SGqk <- GE_SpatialGrid(qk)
png(file=paste(tf, ".png", sep=""), width=SGqk$width, height=SGqk$height,
  bg="transparent")
par(mar=c(0,0,0,0), xaxs="i", yaxs="i")
plot(qk, xlim=SGqk$xlim, ylim=SGqk$ylim, setParUsrBB=TRUE)
dev.off()
kmlOverlay(SGqk, paste(tf, ".kml", sep=""), paste(tf, ".png", sep=""))
## Not run: 
##D #library(rgdal)
##D #qk0 <- quakes
##D #qk0$long <- ifelse(qk0$long <= 180, qk0$long, qk0$long-360)
##D #qk0a <- SpatialPointsDataFrame(qk0[, c(2:1)], qk0)
##D #proj4string(qk0a) <- CRS("+proj=longlat +ellps=WGS84")
##D #writeOGR(qk0a, paste(tf, "v.kml", sep=""), "Quakes", "KML")
##D #system(paste("googleearth ", tf, ".kml", sep=""))
## End(Not run)
options(example.ask=opt_exask)



