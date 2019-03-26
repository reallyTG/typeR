library(LocalControlStrategy)


### Name: LCsetup
### Title: Specify KEY parameters used in Local Control (LC) Strategy to
###   "design" analyses of Observational Data.
### Aliases: LCsetup
### Keywords: design

### ** Examples

  ## Not run: 
##D   # Long running example...
##D   data(pci15k)
##D   xvars <- c("stent", "height", "female", "diabetic", "acutemi", "ejfract", "ves1proc")
##D   hclobj <- LCcluster(pci15k, xvars)
##D   LCe <- LCsetup(hclobj, pci15k, thin, surv6mo)
##D   ls.str(LCe)
##D   
## End(Not run)



