library(aiRthermo)


### Name: bruntVaisallaOmegaSquared
### Title: Brunt-Vaisalla (angular) frequency (squared)
### Aliases: bruntVaisallaOmegaSquared
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
bruntVaisallaOmegaSquared(dPs,dTs,dws)




