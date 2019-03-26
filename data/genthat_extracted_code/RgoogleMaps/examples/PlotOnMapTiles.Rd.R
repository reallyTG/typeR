library(RgoogleMaps)


### Name: PlotOnMapTiles
### Title: plots on map tiles by "stitching" them together
### Aliases: PlotOnMapTiles

### ** Examples






if (0){


  lat = c(40.702147,40.718217,40.711614);


  lon = c(-74.012318,-74.015794,-73.998284);


  center = c(mean(lat), mean(lon));


  zoom <- min(MaxZoom(range(lat), range(lon)));


  bb=qbbox(lat,lon)


  


  mt = GetMapTiles(latR =bb$latR , lonR=bb$lonR,zoom=zoom,verbose=1)


  PlotOnMapTiles(mt,lat=lat,lon=lon,pch=20,col=c('red', 'blue', 'green'),cex=2)


  


  mt = GetMapTiles(latR =bb$latR , lonR=bb$lonR,zoom=zoom,


                   tileDir= "~/mapTiles/Google/")


  PlotOnMapTiles(mt,lat=lat,lon=lon,pch=20,col=c('red', 'blue', 'green'),cex=2)


  


}





