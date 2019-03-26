library(VdgRsm)


### Name: spv
### Title: Spherical Prediction Variance
### Aliases: spv
### Keywords: Spherical Designs

### ** Examples

CCD1<- gen.CCD(n.vars = 3, n.center = 2, alpha = 1)
CCD2<- gen.CCD(n.vars = 3, n.center = 2, alpha = sqrt(3))
spv(CCD1, CCD2, des.names = c("CCD 1","CCD 2"))



