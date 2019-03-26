library(CensSpatial)


### Name: distmatrix
### Title: Distance matrix
### Aliases: distmatrix
### Keywords: Spatial Censored SAEM

### ** Examples

n<-200
n1=100

####Simulating spatial coordinates##
r1=sample(seq(1,30,length=400),n+n1)
r2=sample(seq(1,30,length=400),n+n1)
coords=cbind(r1,r2)

H=distmatrix(coords)



