library(RgoogleMaps)


### Name: XY2LatLon
### Title: computes the centered coordinate transformation from lat/lon to
###   map tile coordinates
### Aliases: XY2LatLon

### ** Examples



#quick test:





  zoom=12;MyMap <- list(40,-120,zoom, url="google", BBOX = list(ll=c(35,-125), ur=c(45,-115)));


  LatLon <- c(lat = 40.0123, lon = -120.0123);


  Rcoords <- LatLon2XY.centered(MyMap,LatLon["lat"],LatLon["lon"])


  newLatLon <- XY2LatLon(MyMap, Rcoords$newX, Rcoords$newY)


  max(abs(newLatLon - LatLon));





#more systematic:


 for (zoom in 2:10){


   cat("zoom: ", zoom, "\n");


   MyMap <- list(40,-120,zoom, url="google", BBOX = list(ll=c(35,-125), ur=c(45,-115)));


   LatLon <- c(lat = runif(1,-80,80), lon = runif(1,-170,170));


   Rcoords <- LatLon2XY.centered(MyMap,LatLon["lat"],LatLon["lon"])


   newLatLon <- XY2LatLon(MyMap, Rcoords$newX, Rcoords$newY)


   if(max(abs(newLatLon - LatLon)) > 0.0001) print(rbind(LatLon, newLatLon));


 }








