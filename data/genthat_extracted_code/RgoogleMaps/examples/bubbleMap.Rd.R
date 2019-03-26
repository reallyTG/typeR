library(RgoogleMaps)


### Name: bubbleMap
### Title: Create a bubble plot of spatial data on Google Maps
### Aliases: bubbleMap

### ** Examples



data(lat.lon.meuse, package="loa", envir = environment())





map <- GetMap(center=c(lat=50.97494,lon=5.743606), zoom=13,


       size=c(480,480),destfile = file.path(tempdir(),"meuse.png"),


        maptype="mobile", SCALE = 1);





par(cex=1.5)


bubbleMap(lat.lon.meuse, coords = c("longitude","latitude"), map=map,


      zcol='zinc', key.entries = 100+ 100 * 2^(0:4));








