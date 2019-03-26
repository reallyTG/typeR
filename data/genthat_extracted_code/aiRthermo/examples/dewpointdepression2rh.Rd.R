library(aiRthermo)


### Name: dewpointdepression2rh
### Title: Relative Humidity from the dew point depression
### Aliases: dewpointdepression2rh
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
dTds=w2Td(dPs,dws)
dDPDs=dTs-dTds
dewpointdepression2rh(dPs,dTs,dDPDs)



