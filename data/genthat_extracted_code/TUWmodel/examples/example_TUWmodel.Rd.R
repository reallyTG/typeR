library(TUWmodel)


### Name: example_TUWmodel
### Title: Data-sample
### Aliases: example_TUWmodel Q_Vils P_Vils T_Vils PET_Vils SWE_Vils
###   areas_Vils
### Keywords: datasets

### ** Examples

data(example_TUWmodel)

ls()

t <- as.Date(rownames(P_Vils))
plot(t, apply(P_Vils, 1, weighted.mean, w=areas_Vils), 
     type="S", xlab="", ylab="Precipitation [mm/day]")

plot(t, apply(PET_Vils, 1, weighted.mean, w=areas_Vils), 
     type="l", xlab="", ylab="Potential evapotranspiration [mm/day]")

plot(t, T_Vils[,1], type="l", xlab="", ylab="Temperature [degC]")
 lines(t, T_Vils[,6], col=3)

plot(t, SWE_Vils[,6], col=3, type="l", xlab="", ylab="Snow water equivalent [mm]")
 lines(t, SWE_Vils[,1], col=1)

plot(as.Date(names(Q_Vils)), Q_Vils, type="l", xlab="", ylab="Runoff [mm/day]")



