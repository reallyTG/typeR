library(aiRthermo)


### Name: densityDry
### Title: Density of Dry Air
### Aliases: densityDry
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
densityDry(dPs,dTs)



