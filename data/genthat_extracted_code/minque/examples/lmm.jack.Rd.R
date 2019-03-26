library(minque)


### Name: lmm.jack
### Title: An R function for linear mixed model analysis
### Aliases: lmm.jack
### Keywords: MINQUE linear mixed model variance components jackknife REML

### ** Examples

  library(minque)
  data(ncii)
  res=lmm.jack(Yld~1|Female*Male+Rep,data=ncii,
     JacNum=10,JacRep=1,ALPHA=0.05)
  res$Var
  res$PVar
  res$FixedEffect
  res$RandomEffect
  #End




