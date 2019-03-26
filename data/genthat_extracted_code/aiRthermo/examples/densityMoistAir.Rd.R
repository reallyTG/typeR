library(aiRthermo)


### Name: densityMoistAir
### Title: Density of Moist Air
### Aliases: densityMoistAir
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
aws<-RadiosondeA[,6]/1000
densityMoistAir(aPs,aTs,aws)



