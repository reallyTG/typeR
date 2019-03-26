library(aiRthermo)


### Name: LIindex
### Title: Lifted index
### Aliases: LIindex
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
aws<-RadiosondeA[,6]/1000
LIindex(aPs,aTs,aws,max(aPs),5,2500,0)



