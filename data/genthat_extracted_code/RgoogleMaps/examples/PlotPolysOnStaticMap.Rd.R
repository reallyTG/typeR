library(RgoogleMaps)


### Name: PlotPolysOnStaticMap
### Title: plots polygons on map
### Aliases: PlotPolysOnStaticMap

### ** Examples



if (interactive()){


  #require(PBSmapping);


  shpFile <- paste(system.file(package = "RgoogleMaps"), "/shapes/bg11_d00.shp", sep = "")


  #shpFile <- system.file('bg11_d00.shp', package = "RgoogleMaps");


  


  shp=importShapefile(shpFile,projection="LL");


  bb <- qbbox(lat = shp[,"Y"], lon = shp[,"X"]);


  MyMap <- GetMap.bbox(bb$lonR, bb$latR, destfile = "DC.png");


  PlotPolysOnStaticMap(MyMap, shp, lwd=.5, col = rgb(0.25,0.25,0.25,0.025), add = F);


  


  #Try an open street map:





  mapOSM <- GetMap.OSM(lonR=bb$lonR, latR=bb$latR, scale = 150000, destfile = "DC.png");


  PlotPolysOnStaticMap(mapOSM, shp, lwd=.5, col = rgb(0.75,0.25,0.25,0.15), add = F);





  #North Carolina SIDS data set:


  shpFile <- system.file("shapes/sids.shp", package="maptools");


  shp=importShapefile(shpFile,projection="LL");


  bb <- qbbox(lat = shp[,"Y"], lon = shp[,"X"]);


  MyMap <- GetMap.bbox(bb$lonR, bb$latR, destfile = "SIDS.png");


  #compute regularized SID rate


  sid <- 100*attr(shp, "PolyData")$SID74/(attr(shp, "PolyData")$BIR74+500)


  b <- as.integer(cut(sid, quantile(sid, seq(0,1,length=8)) ));


  b[is.na(b)] <- 1;


  opal <- col2rgb(grey.colors(7), alpha=TRUE)/255; opal["alpha",] <- 0.2;


  shp[,"col"] <- rgb(0.1,0.1,0.1,0.2);


  for (i in 1:length(b)) 


    shp[shp[,"PID"] == i,"col"] <- rgb(opal[1,b[i]],opal[2,b[i]],opal[3,b[i]],opal[4,b[i]]);


  PlotPolysOnStaticMap(MyMap, shp, lwd=.5, col = shp[,"col"], add = F);


  


  #compare the accuracy of this plot to a Google Map overlay:


  library(maptools);


  qk <- SpatialPointsDataFrame(as.data.frame(shp[, c("X","Y")]), as.data.frame(shp[, c("X","Y")]))


  sp::proj4string(qk) <- CRS("+proj=longlat");


  tf <- "NC.counties";


  SGqk <- GE_SpatialGrid(qk)


  png(file=paste(tf, ".png", sep=""), width=SGqk$width, height=SGqk$height,


  bg="transparent")


  par(mar=c(0,0,0,0), xaxs="i", yaxs="i");par(mai = rep(0,4))


  PBSmapping::plotPolys(shp, plt=NULL)


  dev.off()


  maptools::kmlOverlay(SGqk, paste(tf, ".kml", sep=""), paste(tf, ".png", sep=""));


  #This kml file can now be inspected in Google Earth or Google Maps


  


  #or choose an aspect ratio that corresponds better to North Carolina's elongated shape:


  MyMap <- GetMap.bbox(bb$lonR, bb$latR, destfile = "SIDS.png", size = c(640, 320), zoom = 7);


  PlotPolysOnStaticMap(MyMap, shp, lwd=.5, col = shp[,"col"], add = F);


 }





