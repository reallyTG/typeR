library(RgoogleMaps)


### Name: plotmap
### Title: easy to use wrapper function
### Aliases: plotmap

### ** Examples



if (0){


  #####################Google maps#############################


  mapBG1 = plotmap("Brandenburg Gate, Berlin", zoom = 15)





  #####################bing maps#############################


  


  #for bing maps you will need your own API key, 


  #sign up at https://msdn.microsoft.com/en-us/library/ff428642.aspx


  apiKey = scan("C:/Users/loecherm/Dropbox/stuff/bingAPIkey.txt",what="")


  mapBG2 = plotmap("Brandenburg Gate, Berlin", zoom = 15, API = "bing", apiKey=apiKey)


  


  latlon <- cbind.data.frame(lat = c(38.898648,38.889112, 38.880940), 


                              lon = c(-77.037692, -77.050273, -77.03660));


  


  


  map3 = plotmap(lat = latlon$lat, lon = latlon$lon, API = "bing", apiKey=apiKey,


                 col = "purple", pch="X",cex=1.5)


  


  


  #####################OSM maps#############################


  map4 = plotmap(lat = latlon$lat, lon = latlon$lon, API = "OSM", zoom=15,


                 col = "purple", pch="X",cex=1.5)


}





