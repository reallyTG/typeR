library(MBESS)


### Name: ss.aipe.crd
### Title: Find target sample sizes for the accuracy in unstandardized
###   conditions means estimation in CRD
### Aliases: ss.aipe.crd.nclus.fixedwidth ss.aipe.crd.nindiv.fixedwidth
###   ss.aipe.crd.nclus.fixedbudget ss.aipe.crd.nindiv.fixedbudget
###   ss.aipe.crd.both.fixedbudget ss.aipe.crd.both.fixedwidth

### ** Examples

## Not run: 
##D # Examples for each function
##D ss.aipe.crd.nclus.fixedwidth(width=0.3, nindiv=30, prtreat=0.5, tauy=0.25, sigma2y=0.75)
##D 
##D ss.aipe.crd.nindiv.fixedwidth(width=0.3, nclus=250, prtreat=0.5, tauy=0.25, sigma2y=0.75)
##D 
##D ss.aipe.crd.nclus.fixedbudget(budget=10000, nindiv=20, cluscost=20, indivcost=1)
##D 
##D ss.aipe.crd.nindiv.fixedbudget(budget=10000, nclus=30, cluscost=20, indivcost=1, 
##D prtreat=0.5, tauy=0.05, sigma2y=0.95, assurance=0.8)
##D 
##D ss.aipe.crd.both.fixedbudget(budget=10000, cluscost=30, indivcost=1, prtreat=0.5, tauy=0.25, 
##D 	sigma2y=0.75)
##D 
##D ss.aipe.crd.both.fixedwidth(width=0.3, cluscost=0, indivcost=1, prtreat=0.5, tauy=0.25, 
##D 	sigma2y=0.75)
##D 
##D # Examples for different cluster size
##D ss.aipe.crd.nclus.fixedwidth(width=0.3, nindiv=30, prtreat=0.5, tauy=0.25, sigma2y=0.75, 
##D diffsize = c(-2, 1, 0, 2, -1, 3, -3, 0, 0))
##D 
##D ss.aipe.crd.nclus.fixedwidth(width=0.3, nindiv=30, prtreat=0.5, tauy=0.25, sigma2y=0.75, 
##D diffsize = c(0.6, 1.2, 0.8, 1.4, 1, 1, 1.1, 0.9))
## End(Not run)



