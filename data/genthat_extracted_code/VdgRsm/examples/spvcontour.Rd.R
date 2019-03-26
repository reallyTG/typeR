library(VdgRsm)


### Name: spvcontour
### Title: Contour Plot of Scaled Prediction Variances
### Aliases: spvcontour
### Keywords: Contour Plot

### ** Examples
 
  library(akima)
  CCD1<- gen.CCD(n.vars = 2, n.center = 2, alpha = 1)
  spvcontour(CCD1, shape = "square")
  CCD2<-gen.CCD(n.var = 2, alpha = sqrt(2), n.center = 3)
  spvcontour(CCD2, shape = "circle")
  spvcontour(CCD2, shape = "circle", length = 200)
  spvcontour(CCD2, shape = "circle", length = 200, nlevels = 20)



