library(minque)


### Name: lmm.check
### Title: An R function to obtain information from a linear mixed model
### Aliases: lmm.check
### Keywords: linear mixed model model check

### ** Examples

  
  library(minque)
  data(ncii)
  ncii$Female=factor(ncii$Female)
  lmm.inf=lmm.check(Yld~Female|Female*Male+Rep,data=ncii)
  lmm.inf
  
  #End





