library(aiRthermo)


### Name: virtual_temperature
### Title: Virtual Temperature
### Aliases: virtual_temperature
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
virtual_temperature(dPs,dTs,dws)



