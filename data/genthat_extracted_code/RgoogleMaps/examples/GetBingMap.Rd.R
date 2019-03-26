library(RgoogleMaps)


### Name: GetBingMap
### Title: download a static map from the Microsoft map tile server
### Aliases: GetBingMap

### ** Examples






if (0){


  #for bing maps you will need your own API key, 


  #sign up at https://msdn.microsoft.com/en-us/library/ff428642.aspx


  apiKey = scan("C:/Users/loecherm/Dropbox/stuff/bingAPIkey.txt",what="")


  map1=GetBingMap(center=c(47.619048,-122.35384),zoom=15,apiKey=apiKey, 


                  verbose=1, destfile="Seattle.png") 


  PlotOnStaticMap(map1)


  m="&pp=47.620495,-122.34931;21;AA&pp=47.619385,-122.351485;;AB&pp=47.616295,-122.3556;22"


  map2=GetBingMap(center=c(47.619048,-122.35384),zoom=15,markers=m,apiKey=apiKey, 


                  verbose=1, destfile="Seattle2.png")


  


  PlotOnStaticMap(map2,lat=c(47.620495,47.619385,47.616295),


                  lon=c(-122.34931,-122.351485,-122.3556))


  	


  m="&pp=49.28273,-123.12074;22&pp=44.05207,-123.08675;22"


  


  map3= GetBingMap(center=c(47.677006,-122.125526),zoom=6,markers=m,apiKey=apiKey,


                   verbose=1, destfile="Seattle2.png")


  #plotmap(map=map3)


  m=cbind.data.frame(lat=c(49.28273,44.05207),lon=c(-123.12074,-123.08675),col=c(3:4))


  PlotOnStaticMap(map3, lat =m$lat,lon=m$lon,col=m$col,pch=19)


  


  #overlay traffic:


  #Get a map with Road imagery and traffic flow based on a query.


  #This example gets a map with road imagery based on a query result Bellevue, Washington. 


  #Traffic flow is also included on the map.


  


  #http://dev.virtualearth.net/REST/V1/Imagery/Map/Road/Bellevue%20Washington


  #?mapLayer=TrafficFlow&key=BingMapsKey


  #note that we are using the extraURL argument to pass any extra parameters:


  map4 = GetBingMap(center="Bellevue%20Washington", zoom=12, extraURL="&mapLayer=TrafficFlow", 


                    apiKey=apiKey,verbose=1, destfile="BellevueTraffic.png")


  PlotOnStaticMap(map4)


  


  #Get a map with Road imagery that displays a route.


  #This example gets a map with road imagery that displays a driving 


  #route between the cities of Seattle and Redmond in Washington State. 


  


  #note that we are using the extraURL argument to pass any extra parameters:


  #http://dev.virtualearth.net/REST/v1/Imagery/Map/Road/Routes


  #?wp.0=Seattle,WA;64;1&wp.1=Redmond,WA;66;2&key=BingMapsKey 


  map5 = GetBingMap(center="Bellevue%20Washington", zoom=8, 


                    extraURL="&Routes?wp.0=Seattle,WA;64;1&wp.1=Redmond,WA;66;2", 


                  apiKey=apiKey,verbose=1, destfile="Seattle2Redmond.png")


  PlotOnStaticMap(map5)


}





