library(CensSpatial)


### Name: derivcormatrix
### Title: First and second derivates of some correlation matrix
### Aliases: derivcormatrix
### Keywords: Spatial Censored SAEM

### ** Examples

n<-200
n1=100
r1=sample(seq(1,30,length=400),n+n1)
r2=sample(seq(1,30,length=400),n+n1)
coords=cbind(r1,r2)

s=derivcormatrix(coords=coords,phi=2,kappa=2,cov.model="exponential")




