library(LocalControlStrategy)


### Name: ivadj
### Title: Instrumental Variable LAO Fitting and Smoothing
### Aliases: ivadj
### Keywords: nonparametric

### ** Examples

  ## Not run: 
##D   # Long running example...
##D   data(pci15k)
##D   xvars <- c("stent", "height", "female", "diabetic", "acutemi", "ejfract", "ves1proc")
##D   hclobj <- LCcluster(pci15k, xvars)
##D   LC.env <- LCsetup(hclobj, pci15k, thin, surv6mo)
##D   surv050 <- ltdagg(50, LC.env)
##D   iv050 <- ivadj(surv050)
##D   iv050
##D   plot(iv050)
##D   
## End(Not run)



