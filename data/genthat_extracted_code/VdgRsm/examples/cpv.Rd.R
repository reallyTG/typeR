library(VdgRsm)


### Name: cpv
### Title: Cuboidal Prediction Variance
### Aliases: cpv
### Keywords: Cuboidal Designs

### ** Examples

CCD1<- gen.CCD(n.vars = 3, n.center = 2, alpha = 1)
CCD2<- gen.CCD(n.vars = 3, n.center = 5, alpha = 1)
cpv(CCD1, CCD2, des.names = c("CCD with nc=2", "CCD with nc=5"), add.pts = FALSE)



