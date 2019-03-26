library(ClimClass)


### Name: climate
### Title: Climate normals
### Aliases: climate

### ** Examples


data(Trent_climate)

# clima_81_10 is a list of data frames of the type series, 
# each one referring to one station 
# having climatic means of temperature and precipitation 

clima_81_10<-lapply(lista_cli, FUN=climate, first.yr=1981, last.yr=2010, max.perc.missing=15)




