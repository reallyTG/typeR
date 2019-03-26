library(RgoogleMaps)


### Name: GetMap
### Title: download a static map from the Google server
### Aliases: GetMap

### ** Examples


  lat = c(40.702147,40.718217,40.711614);

  lon = c(-74.012318,-74.015794,-73.998284);

  center = c(mean(lat), mean(lon));

  zoom <- min(MaxZoom(range(lat), range(lon)));

  #this overhead is taken care of implicitly by GetMap.bbox(); 

  markers = paste0("&markers=color:blue|label:S|40.702147,-74.015794&markers=color:",

                   "green|label:G|40.711614,-74.012318&markers=color:red|color:red|",

                   "label:C|40.718217,-73.998284")

  myMap <- GetMap(center=center, zoom=zoom,markers=markers);

  #Note that in the presence of markers one often needs to add some extra padding to the 

  #latitude range to accomodate the extent of the top most marker

  if (0){#takes too long to run for CRAN check

  #add a path, i.e. polyline:

myMap <- GetMap(center=center, zoom=zoom,

  path = paste0("&path=color:0x0000ff|weight:5|40.737102,-73.990318|",

  "40.749825,-73.987963|40.752946,-73.987384|40.755823,-73.986397"));

  #use implicit geo coding 

  BrooklynMap <- GetMap(center="Brooklyn", zoom=13)

  PlotOnStaticMap(BrooklynMap)

  

  #use implicit geo coding and display labels in Korean:

  BrooklynMap <- GetMap(center="Brooklyn", zoom=13, hl="ko")

  PlotOnStaticMap(BrooklynMap)

  

  #no highways

   ManHatMap <- GetMap(center="Lower Manhattan", zoom=14, 
                      extraURL="&style=feature:road.highway|visibility:off",
                      destfile = "LowerManhattan.png")
                      
  PlotOnStaticMap(ManHatMap)

   #reload the map without a new download:
  ManHatMap <- GetMap(destfile = "LowerManhattan.png",NEWMAP=FALSE)
  PlotOnStaticMap(ManHatMap)

   #The example below defines a polygonal area within Manhattan, passed a series of 

  #intersections as locations:

#myMap <- GetMap(path = paste0("&path=color:0x00000000|weight:5|fillcolor:0xFFFF0033|",

#          "8th+Avenue+%26+34th+St,New+York,NY|8th+Avenue+%26+42nd+St,New+York,NY|",

#          "Park+Ave+%26+42nd+St,New+York,NY,NY|Park+Ave+%26+34th+St,New+York,NY,NY"),

#            destfile = "MyTile3a.png");



  #note that since the path string is just appended to the URL you can "abuse" the path 

  #argument to pass anything to the query, e.g. the style parameter:

  #The following example displays a map of Brooklyn where local roads have been changed 

  #to bright green and the residential areas have been changed to black:

  # myMap <- GetMap(center="Brooklyn", zoom=12, maptype = "roadmap", 

  #path = paste0("&style=feature:road.local|element:geometry|hue:0x00ff00|",

  #        "saturation:100&style=feature:landscape|element:geometry|lightness:-100"),

  #        sensor='false', destfile = "MyTile4.png",  RETURNIMAGE = FALSE);

   

   #In the last example we set RETURNIMAGE to FALSE which is a useful feature in general

  #if png is not installed. In that cases, the images can still be fetched 

  #and saved but not read into R.



  #In the following example we let the Static Maps API determine the correct center and 

  #zoom level implicitly, based on evaluation of the position of the markers. 

  #However, to be of use within R we do need to know the values for zoom and 

  #center explicitly, so it is better practice to compute them ourselves and 

  #pass them as arguments, in which case meta information on the map tile can be saved as well.

  

  #myMap <- GetMap(markers = paste0("&markers=color:blue|label:S|40.702147,-74.015794&",

  #          "markers=color:green|label:G|40.711614,-74.012318&markers=color:red|",

  #          "color:red|label:C|40.718217,-73.998284"), 

  #           destfile = "MyTile1.png",  RETURNIMAGE = FALSE);

  }




