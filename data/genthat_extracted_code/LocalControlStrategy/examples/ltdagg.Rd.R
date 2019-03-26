library(LocalControlStrategy)


### Name: ltdagg
### Title: Calculate the Observed Distribution of LTDs in Local Control
###   Strategy
### Aliases: ltdagg
### Keywords: nonparametric

### ** Examples

  ## Not run: 
##D   # Long running example...
##D     data(pci15k)
##D     xvars <- c("stent", "height", "female", "diabetic", "acutemi", "ejfract", "ves1proc")
##D     hclobj <- LCcluster(pci15k, xvars)
##D     LCe <- LCsetup(hclobj, pci15k, thin, surv6mo)
##D     surv050 <- ltdagg(50, LCe)
##D     surv050
##D     plot(surv050, LCe)
##D   
## End(Not run)



