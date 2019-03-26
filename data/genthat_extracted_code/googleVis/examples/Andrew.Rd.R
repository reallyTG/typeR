library(googleVis)


### Name: Andrew
### Title: Hurricane Andrew: googleVis example data set
### Aliases: Andrew
### Keywords: datasets

### ** Examples

data(Andrew)

AndrewGeoMap <- gvisGeoMap(Andrew, locationvar='LatLong', numvar='Speed_kt',
                          hovervar='Category',
                          options=list(width=800,height=400,
                          region='US', dataMode='Markers'))

AndrewMap <- gvisMap(Andrew, 'LatLong' , 'Tip',
                           options=list(showTip=TRUE, showLine=TRUE,
                           enableScrollWheel=TRUE,
                           mapType='hybrid', useMapTypeControl=TRUE,
			   width=800,height=400))

AndrewTable <- gvisTable(Andrew,options=list(width=800))

## Combine the outputs into one page:

AndrewVis <- gvisMerge(AndrewGeoMap, AndrewMap)

plot(AndrewVis)




