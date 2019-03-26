library(aiRthermo)


### Name: PW
### Title: Vertically integrated water vapour column
### Aliases: PW
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dws<-RadiosondeD[,6]/1000
PW(dws,dPs,dPs[1])



