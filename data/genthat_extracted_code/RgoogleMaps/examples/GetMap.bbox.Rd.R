library(RgoogleMaps)


### Name: GetMap.bbox
### Title: GetMap bbox
### Aliases: GetMap.bbox

### ** Examples



 mymarkers <- cbind.data.frame(lat = c(38.898648,38.889112, 38.880940), 


          lon = c(-77.037692, -77.050273, -77.03660), size =  c('tiny','tiny','tiny'), 


          col = c('blue', 'green', 'red'), char = c('','',''));





##get the bounding box:


  bb <- qbbox(lat = mymarkers[,"lat"], lon = mymarkers[,"lon"]);


  


##download the map:


  MyMap <- GetMap.bbox(bb$lonR, bb$latR, destfile = "DC.png", GRAYSCALE =TRUE,


                markers = mymarkers);


 ##The function qbbox() basically computes a bounding box for the given lat,lon 


   #points with a few additional options such as quantile boxes, additional buffers, etc.  


  bb <- qbbox(c(40.702147,40.711614,40.718217),c(-74.015794,-74.012318,-73.998284), 


            TYPE = "all", margin = list(m=rep(5,4), TYPE = c("perc", "abs")[1]));


 ##download the map:           


MyMap <- GetMap.bbox(bb$lonR, bb$latR,destfile = "MyTile3.png", maptype = "satellite") 











