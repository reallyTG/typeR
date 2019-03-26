library(MARSS)


### Name: glance.marssMLE
### Title: Return brief summary information on a MARSS fit
### Aliases: glance.marssMLE

### ** Examples

  dat <- t(harborSeal)
  dat <- dat[c(2,11,12),]
  MLEobj <- MARSS(dat, model=list(Z=factor(c("WA","OR","OR"))))
  
  library(broom)
  glance(MLEobj)



