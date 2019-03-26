library(aiRthermo)


### Name: q2w
### Title: Water vapour mixing Ratio to specific humidity
### Aliases: q2w
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dws<-RadiosondeD[,6]/1000
q2w(w2q(dws))



