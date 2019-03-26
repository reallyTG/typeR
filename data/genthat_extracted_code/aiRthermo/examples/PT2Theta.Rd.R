library(aiRthermo)


### Name: PT2Theta
### Title: Potential Temperature from pressure and temperature
### Aliases: PT2Theta
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dThetas=PT2Theta(dPs,dTs)



