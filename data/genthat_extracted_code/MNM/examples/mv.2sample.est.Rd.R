library(MNM)


### Name: mv.2sample.est
### Title: Multivariate Two Sample Shift Estimates
### Aliases: mv.2sample.est
### Keywords: multivariate nonparametric

### ** Examples

X1<- rmvnorm(50,c(0,0,0))
X2<- rmvnorm(70,c(1,1,2))
X<-rbind(X1,X2)
g<-factor(rep(1:2,c(50,70)))

  est.Hot.X <- mv.2sample.est(X, g)
  est.SS.o.X <- mv.2sample.est(X, g, "s")
  est.SS.i.X <- mv.2sample.est(X, g, "s", "i")
  est.SR.o.X <- mv.2sample.est(X, g, "r")
  est.SR.i.X <- mv.2sample.est(X, g, "r", "i")

  est.SS.o.X
  
  summary(est.SS.o.X)
  
  # plotting
   
  plotMvloc(est.Hot.X, est.SS.i.X, est.SR.i.X)




