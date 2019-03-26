library(ClimClass)


### Name: koeppen_geiger
### Title: Koeppen - Geiger's climate classification
### Aliases: koeppen_geiger

### ** Examples

data(Trent_climate)
# clima_81_10 is a list of data frames having climatic means of temperature and precipitation as 
# required by Koeppen - Geiger classification, each one referring to one station. 
# It can be the output of function climate.
class_clim_l<-lapply(clima_81_10, FUN=koeppen_geiger, A_B_C_special_sub.classes=TRUE)




