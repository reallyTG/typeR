library(AGSDest)


### Name: as.GST
### Title: as Group Sequential Trial
### Aliases: as.GST
### Keywords: methods

### ** Examples

GSD <- plan.GST(K=4,SF=1,phi=0,alpha=0.025,delta=6,pow=0.8,compute.alab=TRUE,compute.als=TRUE)
GSDo <- list(T=2, z=3.1)
GST <- as.GST(GSD=GSD,GSDo=GSDo)
GST



