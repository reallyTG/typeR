library(CUB)


### Name: probcub00
### Title: Probability distribution of a CUB model without covariates
### Aliases: probcub00
### Keywords: distribution

### ** Examples

m<-9
pai<-0.3
csi<-0.8
pr<-probcub00(m,pai,csi)
plot(1:m,pr,type="h",main="CUB probability distribution",xlab="Ordinal categories")
points(1:m,pr,pch=19)



