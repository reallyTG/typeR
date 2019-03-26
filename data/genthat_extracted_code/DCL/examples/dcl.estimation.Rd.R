library(DCL)


### Name: dcl.estimation
### Title: Parameter estimation - Double Chain Ladder model
### Aliases: dcl.estimation
### Keywords: models

### ** Examples

data(NtriangleDCL)
data(XtriangleDCL)
# Estimation of the DCL parameters described in Martinez-Miranda, Nielsen and Verrall (2012)
est1<-dcl.estimation(XtriangleDCL,NtriangleDCL)
Plot.dcl.par(est1)
# Compare two possible adjustmets to get distributional parameters
# est1 with adj=1
pj.1<-est1$pj
pi.delay<-est1$pi.delay
est2<-dcl.estimation(XtriangleDCL,NtriangleDCL,adj=2,Tables=FALSE)
pj.2<-est2$pj
data.frame(pi.delay=pi.delay,pj.adj.1=pj.1,pj.adj.2=pj.2)



