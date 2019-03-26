library(MaskJointDensity)


### Name: encriptNoise
### Title: encript noise
### Aliases: encriptNoise
### Keywords: noisefile

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--  or do  help(data=index)  for the standard data sets.

c2<-rnorm(100,0,1)
c2<-abs(c2)
a<-0
b<-2
maxorder<-10
lvls<-NULL
EPS<-1e-06
encriptNoise(c2,a,b,maxorder,lvls,EPS,file.path(tempdir(),"noisefile"))



