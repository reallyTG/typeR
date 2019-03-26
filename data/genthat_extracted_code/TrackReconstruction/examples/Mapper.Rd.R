library(TrackReconstruction)


### Name: Mapper
### Title: Animal track plotting with a color map
### Aliases: Mapper
### Keywords: ~kwd1 ~kwd2

### ** Examples

#A file from GeoRef function that has been thinned to data every 1 minute
data(georef1min26)
data(gpsdata26)
#See the vignette or ?bathymetry for information on how to get 
#bathymetric data for your study area
data(bathymetry)
#This subset is just to save time creating the image.xyz
bathymetryBogs<-subset(bathymetry,Long<=(-168)& Long >=(-169)
	& Lat<= 55 & Lat >=53,select=Long:Depth)
image.xyzBogs=tapply(bathymetryBogs$Depth, list(bathymetryBogs$Long, bathymetryBogs$Lat), unique)
Mapper(georef1min26, gpsdata26, image.xyzBogs, ExpFact = 500, minlat = 53, 
	maxlat = 55, minlong = -169, maxlong = -168, Title = "Fun Graph!!!")

## Not run: 
##D #Plot the entire bathymetry file (this will take a minute or two)
##D image.xyz=tapply(bathymetry$Depth, list(bathymetry$Long, bathymetry$Lat), unique)
##D Bathymetry.palatte<-colorRampPalette(brewer.pal(9, "Blues"),bias=3)
##D #Plot the background map image
##D image.plot(image.xyz,
##D 	col=c(rev(Bathymetry.palatte(200)),terrain.colors(100)),#gray(0:20/20),
##D 	breaks=round(c(seq(from=min(image.xyz),to=0,length.out=201),seq(from=max(image.xyz)/101
##D 	,to=max(image.xyz),length.out=100)))
##D 	#,smallplot=2 #plots legend off x axis
##D 	)
##D #The next examples plot only the part of the background map that contains the relocation data
##D #Example 1
##D data(georef1min02)
##D data(gpsdata02)
##D Mapper(georef1min02, gpsdata02, image.xyz, ExpFact = 500, minlat = 51, maxlat = 60,
##D minlong = -177, maxlong = -163, Title = "Fun Graph!!!")
##D 
##D #Example 2
##D bathymetryBogs2<-subset(bathymetry,Long<=(-168)& Long >=(-169.2)
##D 	& Lat<= 54.3 & Lat >=53.1,select=Long:Depth)
##D image.xyzBogs2=tapply(bathymetryBogs2$Depth, list(bathymetryBogs2$Long, bathymetryBogs2$Lat),
##D 	unique)
##D image.plot(image.xyzBogs2,
##D 	col=c(rev(Bathymetry.palatte(200)),terrain.colors(100)),#gray(0:20/20),
##D 	breaks=round(c(seq(from=min(image.xyz),to=0,length.out=201),seq(from=max(image.xyz)/101
##D 	,to=max(image.xyz),length.out=100)))
##D 	#,smallplot=2 #plots legend off x axis
##D 	)
##D win.graph()
##D #Note the reduction in pixelation
##D data(georef1min95)
##D data(gpsdata95)
##D Mapper(georef1min95, gpsdata95, image.xyz, ExpFact = 500, minlat = 51, maxlat = 60,
##D minlong = -177, maxlong = -163, Title = "Fun Graph!!!")
## End(Not run)



