library(aiRthermo)


### Name: Kindex
### Title: K Instability Index
### Aliases: Kindex
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
aws<-RadiosondeA[,6]/1000
aK<-Kindex(aPs,aTs,aws,0)

data(RadiosondeD)
dPs<-RadiosondeD[,1]*100
dTs<-C2K(RadiosondeD[,3])
dws<-RadiosondeD[,6]/1000
dK<-Kindex(dPs,dTs,dws,0)



