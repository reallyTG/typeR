library(loa)


### Name: 3.1.example.data
### Title: example data for use with loa
### Aliases: 3.1.example.data example.data lat.lon.meuse roadmap.meuse
### Keywords: datasets

### ** Examples


## data structure of lat.lon.meuse

head(lat.lon.meuse)

##  Use a subsample of lat.lon.meuse

temp <- lat.lon.meuse[sample(1:155, 15),]


## various loaPlot examples 
## using lat.lon.meuse

loaPlot(~longitude*latitude, data=temp)

loaPlot(cadmium~longitude*latitude, data=temp)

loaPlot(cadmium~longitude*latitude, col.regions=c("green", "red"), 
        data=temp)

loaPlot(cadmium*50+copper*10+lead*2+zinc~longitude*latitude, panel.zcases = TRUE, 
        col.regions=c("green", "red"), 
        key.z.main="Concentrations", data=temp)


## (off line) GoogleMap example
## using lat.lon.meuse and roadmap.meuse

GoogleMap(zinc~latitude*longitude, data=temp, 
          map=roadmap.meuse, col.regions=c("grey", "darkred"))

#  Note 1:
#  With loaPlot and GoogleMap, note latitude, longitude axes 
#  assignments: 
#  loaPlot plots z ~ x * y | cond. 
#  GoogleMap plots z ~ lat * lon | cond (z ~ y * x | cond)

#  Note 2:
#  Here, the map argument is supplied so example works off-line. 
#  If not supplied and R is on-line, GoogleMap will (try to) get map 
#  from the Google API. Look at:
## Not run: 
##D    GoogleMap(zinc~latitude*longitude, data=lat.lon.meuse, 
##D              col.regions=c("grey", "darkred"))
## End(Not run)
#  (The map will appear slightly different, because non-default 
#  size and maptype settings were used to make roadmap.meuse. See above.)  




