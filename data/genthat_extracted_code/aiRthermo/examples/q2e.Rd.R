library(aiRthermo)


### Name: q2e
### Title: Partial Vapour Pressure
### Aliases: q2e
### Keywords: Functions

### ** Examples

# Get partial pressure of water vapour
data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dws<-RadiosondeD[,6]/1000
h2oe<-q2e(dPs,w2q(dws))



