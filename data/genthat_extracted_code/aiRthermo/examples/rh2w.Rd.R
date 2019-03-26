library(aiRthermo)


### Name: rh2w
### Title: Mixing Ratio from relative humidity
### Aliases: rh2w
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
dTds<-w2Td(dPs,dws)
rhs<-TTdP2rh(dTs,dTds,dPs)
wfromrh<-rh2w(dPs,dTs,rhs)



