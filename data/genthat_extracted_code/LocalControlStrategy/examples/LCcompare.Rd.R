library(LocalControlStrategy)


### Name: LCcompare
### Title: Display LC Sensitivity Graphic for help in choice of K = Number
###   of Clusters
### Aliases: LCcompare

### ** Examples

  ## Not run: 
##D   # Long running example...
##D   data(pci15k)
##D   xvars <- c("stent", "height", "female", "diabetic", "acutemi", "ejfract", "ves1proc")
##D   hclobj <- LCcluster(pci15k, xvars)
##D   LC.env <- LCsetup(hclobj, pci15k, thin, surv6mo)
##D   surv050 <- ltdagg( 50, LC.env)
##D   surv100 <- ltdagg(100, LC.env)
##D   surv200 <- ltdagg(200, LC.env)
##D   LCcompare(LC.env)
##D   
## End(Not run)



