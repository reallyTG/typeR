library(aiRthermo)


### Name: saturation_mixing_ratio
### Title: Saturation Mixing Ratio
### Aliases: saturation_mixing_ratio
### Keywords: Functions

### ** Examples

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
saturation_mixing_ratio(dPs,dTs)



