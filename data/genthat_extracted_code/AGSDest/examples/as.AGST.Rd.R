library(AGSDest)


### Name: as.AGST
### Title: as Adaptive Group Sequential Trial
### Aliases: as.AGST
### Keywords: methods

### ** Examples

pT=plan.GST(K=3,SF=4,phi=-4,alpha=0.05,delta=6,pow=0.9,compute.alab=TRUE,compute.als=TRUE)
iD=list(T=1, z=1.090728)
swImax=0.0625
I2min=3*swImax
I2max=3*swImax

sT=adapt(pT=pT,iD=iD,SF=1,phi=0,cp=0.8,theta=5,I2min,I2max,swImax)
sTo=list(T=2, z=2.393)
AGST <- as.AGST(pT=pT,iD=iD,sT=sT,sTo=sTo)



