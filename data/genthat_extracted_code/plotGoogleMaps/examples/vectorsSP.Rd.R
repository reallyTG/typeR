library(plotGoogleMaps)


### Name: vectorsSP
### Title: Create radius vector data in form of SpatialLinesDataFrame.
### Aliases: vectorsSP

### ** Examples

# Data preparation
wind<-data.frame( Station=c('Zlatibor' , 'Sjenica' , 
    'Pozega' , 'Kraljevo', 'Kopaonik', 'Kursumlija', 'Krusevac'),
                  Lon=c(19.708418 , 19.999311 , 20.029322,
                  20.724012, 20.776111, 21.279513, 21.307998 ),
                  Lat=c(43.729755 , 43.267913	,43.84859	,
                  43.726812	,43.2725,	43.137053	,43.574188),
                  Temp=c(7,  7,	5,	6,	1,	6,	9),
                  Wind_spd=c(3 , 6,	1	,1,	7	,1	,2),
                  Wind_dir=c(45, 162,  138	,265,	335	,180	,270) )

coordinates(wind)<- ~Lon+Lat
wind@proj4string=CRS('+proj=longlat +datum=WGS84')

wind_vect=vectorsSP(wind,zcol=c('Wind_spd','Wind_dir'))

pal<-colorRampPalette(c( "#CB181D", "#A50F15","#67000D"), space = "Lab")
spplot(wind_vect,'Wind_spd', col.regions=pal(5) )
m=plotGoogleMaps(wind_vect,zcol='Wind_spd', 
      colPalette=pal(5), mapTypeId='ROADMAP',strokeWeight=3)

# plotKML(wind_vect)



