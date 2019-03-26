library(aiRthermo)


### Name: TTheta2P
### Title: Pressure from temperature and potential temperature
### Aliases: TTheta2P
### Keywords: Functions

### ** Examples

	data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
dTds<-w2Td(dPs,dws)
dThetas<-PT2Theta(dPs,dTs)
TTheta2P(dTs,dThetas)




