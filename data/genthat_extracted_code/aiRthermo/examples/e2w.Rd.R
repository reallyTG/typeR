library(aiRthermo)


### Name: e2w
### Title: Compute Mixing Ratio from partial pressure of water vapour
### Aliases: e2w
### Keywords: Functions

### ** Examples

	
	
#Partial pressure of water vapour
data(RadiosondeA)
dPs<-RadiosondeA[,1]*100
dws<-RadiosondeA[,6]/1000
eh2o<-q2e(dPs,w2q(dws))
#Pressure
e2w(eh2o,dPs)



