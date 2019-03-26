library(minque)


### Name: lmm
### Title: An R function for linear mixed model analysis.
### Aliases: lmm
### Keywords: MINQUE linear mixed model variance components REML

### ** Examples

  library(minque)
  data(ncii)
  res=lmm(Yld~1|Female*Male+Rep,data=ncii,method=c("reml","minque"))
  res[[1]]$Var
  res[[1]]$FixedEffect
  res[[1]]$RandomEffect
  #End




