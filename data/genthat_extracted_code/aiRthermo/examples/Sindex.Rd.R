library(aiRthermo)


### Name: Sindex
### Title: Showalter Instability Index
### Aliases: Sindex
### Keywords: Functions

### ** Examples

data(RadiosondeA)
aPs<-RadiosondeA[,1]*100
aTs<-C2K(RadiosondeA[,3])
aws<-RadiosondeA[,6]/1000
S<-Sindex(aPs,aTs,aws,5,0)



