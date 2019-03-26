library(CUB)


### Name: ellecub
### Title: Log-likelihood function of a CUB model without covariates
### Aliases: ellecub
### Keywords: htest

### ** Examples

m<-7
n0<-230
n1<-270
bet<-c(-1.5,1.2)
gama<-c(0.5,-1.2)
pai0<-logis(0,bet); csi0<-logis(0,gama)
pai1<-logis(1,bet); csi1<-logis(1,gama)
ordinal0<-simcub(n0,m,pai0,csi0)
ordinal1<-simcub(n1,m,pai1,csi1)
ordinal<-c(ordinal0,ordinal1)
assepai<-c(rep(pai0,n0),rep(pai1,n1))
assecsi<-c(rep(csi0,n0),rep(csi1,n1))
lli<-ellecub(m,ordinal,assepai,assecsi)



