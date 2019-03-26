library(CUB)


### Name: probcube
### Title: Probability distribution of a CUBE model without covariates
### Aliases: probcube
### Keywords: distribution

### ** Examples

m<-9
pai<-0.3
csi<-0.8
phi<-0.1
pr<-probcube(m,pai,csi,phi)
plot(1:m,pr,type="h", main="CUBE probability distribution",xlab="Ordinal categories")
points(1:m,pr,pch=19)



