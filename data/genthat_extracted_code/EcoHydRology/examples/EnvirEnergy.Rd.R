library(EcoHydRology)


### Name: EnvirEnergy
### Title: The Surface Net Energy Budget
### Aliases: EnvirEnergy

### ** Examples

## The function is currently defined as
function(lat,Jday,Tx,Tn,wind,relativehumidity,cloudiness,albedo,forest,
slope,aspect,surftemp,surfemissivity){
if(cloudiness<0){cloudiness<-EstCloudiness(lat,Jday,Tx,Tn)}

airtemp<-(Tx+Tn)/2 #average daily air temperature [C]

return(Solar(lat,Jday,Tx,Tn,albedo,forest,slope,aspect)+
Longwave(AtmosphericEmissivity(airtemp,cloudiness),airtemp)-
Longwave(surfemissivity,surftemp)+SensibleHeat(surftemp,airtemp,wind)+
EvapHeat(surftemp,airtemp,relativehumidity,Tn,wind)+
RainHeat(airtemp,rain)+GroundHeat())
  }



