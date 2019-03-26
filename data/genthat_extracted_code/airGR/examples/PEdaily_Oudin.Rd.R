library(airGR)


### Name: PEdaily_Oudin
### Title: Computation of daily series of potential evapotranspiration with
###   Oudin's formula
### Aliases: PEdaily_Oudin

### ** Examples

library(airGR)
data(L0123001)
PotEvap <- PEdaily_Oudin(JD = as.POSIXlt(BasinObs$DatesR)$yday, Temp = BasinObs$T,
                         Lat = 0.8, LatUnit = "rad")



