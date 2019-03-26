library(RgoogleMaps)


### Name: GetMapTiles
### Title: download map tiles from specified map tile servers such as
###   openstreetmap or Google
### Aliases: GetMapTiles

### ** Examples



if (0){


tmp=GetMapTiles("World Trade Center, NY", zoom=15,nTiles = c(5,5), verbose=1)


PlotOnMapTiles(tmp)


tmp=GetMapTiles("World Trade Center, NY", zoom=16,nTiles = c(20,20), verbose=1)





tmp2=GetMapTiles("World Trade Center, NY", zoom=15,nTiles = c(5,5), verbose=1,


                urlBase = "http://mt1.google.com/vt/lyrs=m", 


                tileDir= "~/mapTiles/Google/")


tmp=GetMapTiles("Hoboken, NJ", zoom=16,nTiles = c(30,30), verbose=1,


                urlBase = "http://mt1.google.com/vt/lyrs=m", 


                tileDir= "~/mapTiles/Google/")


PlotOnMapTiles(tmp2)





tmp2=GetMapTiles("Werderscher Markt 15, 10117 Berlin", zoom=15,nTiles = c(20,20), verbose=0,


                 urlBase = "http://mt1.google.com/vt/lyrs=m", 


                 tileDir= "~/mapTiles/Google/")





tmp2=GetMapTiles("World Trade Center, NY", zoom=15,nTiles = c(10,10), verbose=1,


                 urlBase = "http://tile.stamen.com/toner/", 


                 tileDir= "~/mapTiles/stamenToner/")





GetMapTiles("World Trade Center, NY", zoom=16,nTiles = c(10,10), verbose=1,


                 urlBase = "http://tile.stamen.com/toner/", 


                 tileDir= "~/mapTiles/stamenToner/")





PlotOnMapTiles(tmp2)








###combine with leaflet:


#From:http://stackoverflow.com/questions/5050851/


#     best-lightweight-web-server-only-static-content-for-windows


#To use Python as a simple web server just change your working 


#directory to the folder with your static content and type 


#python -m SimpleHTTPServer 8000, everything in the directory


#will be available at http:/localhost:8000/


  


library(leaflet)


m = leaflet::leaflet() %>% 


  addTiles( urlTemplate = "http:/localhost:8000/mapTiles/OSM/{z}_{x}_{y}.png")


m = leaflet::leaflet() %>% 


  addTiles( urlTemplate = "http:/localhost:8000/mapTiles/Google/{z}_{x}_{y}.png")


m = m %>% leaflet::setView(-74.01312, 40.71180, zoom = 16)


m = m %>% leaflet::addMarkers(-74.01312, 40.71180)





#Quadriga:


m = m %>% leaflet::setView(13.39780, 52.51534, zoom = 16)


m = m %>% leaflet::addMarkers(13.39780, 52.51534)


}








