library(KnowBR)


### Name: KnowBPolygon
### Title: Discriminating well surveyed polygon units from exhaustive
###   biodiversity databases
### Aliases: KnowBPolygon
### Keywords: KnowBPolygon

### ** Examples


## Not run: 
##D 
##D #Example 1. Only to be used with RWizard
##D 
##D data(Beetles)
##D @_Build_AdWorld_
##D KnowBPolygon(data = Beetles , Area = c("Andalucía>Almería", "Andalucía>Cádiz",
##D "Andalucía>Córdoba", "Andalucía>Granada", "Andalucía>Huelva", "Andalucía>Jaén",
##D "Andalucía>Málaga", "Andalucía>Sevilla", "Aragón>Huesca", "Aragón>Teruel",
##D "Aragón>Zaragoza", "Cantabria>Cantabria", "Castilla y León>Ávila", "Castilla y León>Burgos",
##D "Castilla y León>León", "Castilla y León>Palencia", "Castilla y León>Salamanca",
##D "Castilla y León>Segovia", "Castilla y León>Soria", "Castilla y León>Valladolid",
##D "Castilla y León>Zamora", "Castilla-La Mancha>Albacete", "Castilla-La Mancha>Ciudad Real",
##D "Castilla-La Mancha>Cuenca", "Castilla-La Mancha>Guadalajara", "Castilla-La Mancha>Toledo",
##D "Cataluña>Barcelona", "Cataluña>Girona", "Cataluña>Lleida", "Cataluña>Tarragona",
##D "Ceuta>Ceuta", "Comunidad de Madrid>Madrid", "Comunidad Foral de Navarra>Navarra",
##D "Comunidad Valenciana>Alicante", "Comunidad Valenciana>Castellón",
##D "Comunidad Valenciana>Valencia", "Extremadura>Badajoz", "Extremadura>Cáceres",
##D "Galicia>A Coruña", "Galicia>Lugo", "Galicia>Ourense", "Galicia>Pontevedra",
##D "Islas Baleares>Baleares", "Islas Canarias>Las Palmas", "Islas Canarias>Santa Cruz de Tenerife",
##D "La Rioja>La Rioja", "Melilla>Melilla", "País Vasco>Álava", "País Vasco>Guipúzcoa",
##D "País Vasco>Vizcaya", "Principado de Asturias>Asturias", "Región de Murcia>Murcia") ,
##D minLon = -10 , minLat = 35 , admAreas = TRUE , jpg = FALSE)
##D 
##D #Example 2.
##D 
##D #Download records from GBIF of the flowering plants of the family Polygonaceae
##D 
##D library(rgbif)
##D records<-occ_search(scientificName = "Polygonaceae", limit=5000, return='data',
##D hasCoordinate=TRUE)
##D 
##D #Data frame with the format A required by the function KnowBPolygon
##D 
##D records<-data.frame(records$species,records$decimalLongitude, records$decimalLatitude)
##D names(records)<-c("Species","Longitude","Latitude")
##D 
##D #A column is added to the records with the number of counts
##D #(format A), assuming 1 count per record
##D 
##D dim<-dim(records)
##D Counts<-rep(1,dim[1])
##D records<-cbind(records,Counts)
##D 
##D #Running the function
##D 
##D data(States) #State Boundaries of the United States
##D data(adworld)
##D KnowBPolygon(data=records, shape=States, admAreas=TRUE, shapenames="NAME", minLon=-130,
##D maxLon=-70, minLat=25, maxLat=50, colscale=rev(heat.colors(100)), jpg=FALSE)
## End(Not run)



