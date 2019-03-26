library(aiRthermo)


### Name: equivalentPotentialTemperature
### Title: Equivalent Potential Temperature
### Aliases: equivalentPotentialTemperature
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aP0<-aPs[1]
aT0<-C2K(RadiosondeA[1,3])
aw0<-RadiosondeA[1,6]/1000
deltaP=1
Na=length(aPs)
Ptop=aPs[Na]
fndlcl=find_lcl(Ptop,aP0,aT0,aw0,deltaP)
TLCL=fndlcl$Tlcl
equivalentPotentialTemperature(aP0,aT0,aw0,TLCL)



