library(aiRthermo)


### Name: TTdP2rh
### Title: Relative Humidity from temperature, pressure and dew point
###   temperature
### Aliases: TTdP2rh
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
dTds<-w2Td(dPs,dws)
rhs<-TTdP2rh(dTs,dTds,dPs)




