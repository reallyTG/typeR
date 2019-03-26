library(MNM)


### Name: mv.1sample.est
### Title: Multivariate One Sample Location Estimates
### Aliases: mv.1sample.est
### Keywords: multivariate nonparametric

### ** Examples

  set.seed(1)
  X <- rmvt(100, diag(c(1, 2, 0.5)), 3)
 
  est.Hot.X <- mv.1sample.est(X)
  est.SS.o.X <- mv.1sample.est(X,"s")
  est.SS.i.X <- mv.1sample.est(X,"s","i")
  est.SR.o.X <- mv.1sample.est(X,"r")
  est.SR.i.X <- mv.1sample.est(X,"r","i")
  
  est.SR.o.X
  summary(est.SR.o.X)
  
  # plotting
   
  plot(est.Hot.X, est.SS.i.X, est.SR.i.X, X)
  # or
  plot(est.Hot.X, est.SS.i.X, est.SR.i.X)



