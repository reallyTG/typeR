library(aiRthermo)


### Name: densityH2Ov
### Title: Density of water vapour
### Aliases: densityH2Ov
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
h2oe<-q2e(dPs,w2q(dws))
densityH2Ov(h2oe,dTs)



