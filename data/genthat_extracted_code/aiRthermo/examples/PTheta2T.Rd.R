library(aiRthermo)


### Name: PTheta2T
### Title: Temperature from pressure and potential temperature
### Aliases: PTheta2T
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dThetas=PT2Theta(dPs,dTs)
PTheta2T(dPs,dThetas)



