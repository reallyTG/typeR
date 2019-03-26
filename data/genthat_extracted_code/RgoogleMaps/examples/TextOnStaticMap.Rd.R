library(RgoogleMaps)


### Name: TextOnStaticMap
### Title: plots text on map
### Aliases: TextOnStaticMap

### ** Examples



lat = c(40.702147,40.718217,40.711614);


 lon = c(-74.012318,-74.015794,-73.998284);


 center = c(mean(lat), mean(lon));


 zoom <- min(MaxZoom(range(lat), range(lon)));


 





MyMap <- GetMap(center=center, zoom=zoom,markers = paste0("&markers=color:blue|label:S|",


         "40.702147,-74.015794&markers=color:green|label:G|40.711614,-74.012318&markers=",


          "color:red|color:red|label:C|40.718217,-73.998284"), destfile = "MyTile1.png");


 TextOnStaticMap(MyMap, lat=40.711614,lon=-74.012318, "Some Text", cex=2, col = 'red')


 








