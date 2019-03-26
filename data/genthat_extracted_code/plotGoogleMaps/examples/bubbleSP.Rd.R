library(plotGoogleMaps)


### Name: bubbleSP
### Title: Create bubble data in form of SpatialPolygonsDataFrame.
### Aliases: bubbleSP

### ** Examples

# Data preparation
wind<-data.frame( Station=c('Zlatibor' , 'Sjenica' , 'Pozega' , 
        'Kraljevo', 'Kopaonik', 'Kursumlija', 'Krusevac'),
                  Lon=c(19.708418 , 19.999311 , 20.029322, 
                  20.724012, 20.776111, 21.279513, 21.307998 ),
                  Lat=c(43.729755 , 43.267913	,43.84859	,
                  43.726812,43.2725,	43.137053	,43.574188),
                  Temp=c(7,  7,	5,	6,	1,	6,	9),
                  Wind_spd=c(3 , 6,	1	,1,	7	,1	,2),
                  Wind_dir=c(45, 162,  138	,265,	335	,180	,270) )

coordinates(wind)<- ~Lon+Lat
wind@proj4string=CRS('+proj=longlat +datum=WGS84')

b_temp=bubbleSP(wind,zcol=c('Temp'),max.radius=10000, do.sqrt=FALSE)

pal<-colorRampPalette(c( "#FFF7BC", "#FEC44F","#D95F0E"), space = "Lab")
spplot(b_temp,'Temp', col.regions=pal(5) )
m=plotGoogleMaps(b_temp,zcol='Temp', colPalette=pal(5),strokeWeight=0.5,strokeColor='black')

# plotKML(b_temp, col='Temp')



