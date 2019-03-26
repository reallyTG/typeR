library(ClimClass)


### Name: contin
### Title: Continentality indices
### Aliases: contin

### ** Examples


data(Trent_climate)


# clima_81_10 is a list of data frames having climatic means of temperature and precipitation as 
# required by the aridity indices algorithms, each one referring to one station. 
# It can be the output of function climate.

# creates a data frame with all the continentality indices for all stations in clima_81_10

latit<-coord_elev$North
elev<-coord_elev$Elevation

contin_I<-NULL
for(i in 1:length(clima_81_10)) {
  contin_I[[i]]<-contin(clima_81_10[[i]], 
   latitude=latit[i], 
   elevation=elev[i], 
   Michalet_correction=TRUE)
}
names(contin_I)<-names(clima_81_10)




