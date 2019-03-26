library(TrackReconstruction)


### Name: bathymetry
### Title: Bathymetry data for the Eastern Bering Sea
### Aliases: bathymetry
### Keywords: datasets

### ** Examples

data(bathymetry)
str(bathymetry)
head(bathymetry);tail(bathymetry)
bathymetryBogs<-subset(bathymetry,Long<=(-166) & Long >=(-169)
	& Lat<= 54.5 & Lat >=53,select=Long:Depth)

image.xyz=tapply(bathymetryBogs$Depth, list(bathymetryBogs$Long, bathymetryBogs$Lat), unique)
#create palette for depth colors
Bathymetry.palette<-colorRampPalette(brewer.pal(9, "Blues"),bias=3)
#Plot the background map image
image.plot(image.xyz,
	col=c(rev(Bathymetry.palette(200)),terrain.colors(100)),#gray(0:20/20),
	breaks=round(c(seq(from=min(image.xyz),to=0,length.out=201),seq(from=max(image.xyz)/101
	,to=max(image.xyz),length.out=100)))
	#,smallplot=2 #plots legend off x axis
	)
## Not run: 
##D #If you want to map the entire bathymetry file, it takes a while
##D image.xyz=tapply(bathymetry$Depth, list(bathymetry$Long, bathymetry$Lat), unique)
##D #create palette for depth colors
##D Bathymetry.palette<-colorRampPalette(brewer.pal(9, "Blues"),bias=3)
##D #Plot the background map image
##D image.plot(image.xyz,
##D 	col=c(rev(Bathymetry.palette(200)),terrain.colors(100)),#gray(0:20/20),
##D 	breaks=round(c(seq(from=min(image.xyz),to=0,length.out=201),seq(from=max(image.xyz)/101
##D 	,to=max(image.xyz),length.out=100)))
##D 	#,smallplot=2 #plots legend off x axis
##D 	)
## End(Not run)



