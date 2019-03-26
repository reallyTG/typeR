library(aiRthermo)


### Name: rh2shum
### Title: Specific Humidity from relative humidity
### Aliases: rh2shum
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
dTds<-w2Td(dPs,dws)
rhs<-TTdP2rh(dTs,dTds,dPs)
rh2shum(dPs,dTs,rhs)



