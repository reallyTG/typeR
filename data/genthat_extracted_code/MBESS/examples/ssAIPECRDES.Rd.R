library(MBESS)


### Name: ss.aipe.crd.es
### Title: Find target sample sizes for the accuracy in standardized
###   conditions means estimation in CRD
### Aliases: ss.aipe.crd.es.nclus.fixedwidth
###   ss.aipe.crd.es.nindiv.fixedwidth ss.aipe.crd.es.nclus.fixedbudget
###   ss.aipe.crd.es.nindiv.fixedbudget ss.aipe.crd.es.both.fixedbudget
###   ss.aipe.crd.es.both.fixedwidth

### ** Examples

## Not run: 
##D # Examples for each function
##D ss.aipe.crd.es.nclus.fixedwidth(width=0.3, nindiv=20, es=0.5, estype=1, iccy=0.25, prtreat=0.5, 
##D 	nrep=20)
##D 
##D ss.aipe.crd.es.nindiv.fixedwidth(width=0.3, 250, es=0.5, estype=1, iccy=0.25, prtreat=0.5, 
##D 	nrep=20)
##D 
##D ss.aipe.crd.es.nclus.fixedbudget(budget=1000, nindiv=20, cluscost=0, indivcost=1, nrep=20, 
##D 	prtreat=0.5, iccy=0.25, es=0.5)
##D 
##D ss.aipe.crd.es.nindiv.fixedbudget(budget=1000, nclus=200, cluscost=0, indivcost=1, nrep=20, 
##D 	prtreat=0.5, iccy=0.25, es=0.5)
##D 
##D ss.aipe.crd.es.both.fixedbudget(budget=1000, cluscost=5, indivcost=1, es=0.5, estype=1, 
##D 	iccy=0.25, prtreat=0.5, nrep=20)
##D 
##D ss.aipe.crd.es.both.fixedwidth(width=0.5, cluscost=5, indivcost=1, es=0.5, estype=1, iccy=0.25, 
##D 	prtreat=0.5, nrep=20)
##D 
##D # Examples for different cluster size
##D ss.aipe.crd.es.nclus.fixedwidth(width=0.3, nindiv=20, es=0.5, estype=1, iccy=0.25, prtreat=0.5, 
##D nrep=20, diffsize = c(-2, 1, 0, 2, -1, 3, -3, 0, 0))
##D 
##D ss.aipe.crd.es.nclus.fixedwidth(width=0.3, nindiv=20, es=0.5, estype=1, iccy=0.25, prtreat=0.5, 
##D nrep=20, diffsize = c(0.6, 1.2, 0.8, 1.4, 1, 1, 1.1, 0.9))
## End(Not run)



