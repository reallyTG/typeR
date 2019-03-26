library(aiRthermo)


### Name: gamma_saturated
### Title: Saturated Adiabat Gamma
### Aliases: gamma_saturated
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
gamma_saturated(aPs,aTs)



