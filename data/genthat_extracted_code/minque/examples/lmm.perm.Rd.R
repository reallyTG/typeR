library(minque)


### Name: lmm.perm
### Title: An R function for linear mixed model analysis and permutation
###   test
### Aliases: lmm.perm
### Keywords: MINQUE linear mixed model variance components permutation
###   REML

### ** Examples

  library(minque)
  data(ncii)
  res=lmm.perm(Yld~1|Female*Male+Rep,data=ncii,method=c("reml","minque"))
  res[[1]]
  res[[2]]
  #End




