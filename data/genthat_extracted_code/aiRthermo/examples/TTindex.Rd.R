library(aiRthermo)


### Name: TTindex
### Title: Total-Totals Instability Index
### Aliases: TTindex
### Keywords: Functions

### ** Examples

data(RadiosondeDavenport)
aPs<-RadiosondeDavenport[,1]*100
aTs<-C2K(RadiosondeDavenport[,3])
aws<-RadiosondeDavenport[,6]/1000
aTT<-TTindex(aPs,aTs,aws,0)



