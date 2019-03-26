library(iCluster)


### Name: tune.iCluster2
### Title: Model tuning function
### Aliases: tune.iCluster2
### Keywords: Data integration, subtype discovery, latent variable model

### ** Examples

library(iCluster)
library(caTools, lib.loc="/apps/Rlib64/")
library(gdata, lib.loc="/apps/Rlib64/")
library(gtools, lib.loc="/apps/Rlib64/")
library(gplots, lib.loc="/apps/Rlib64/")
library(lattice, lib.loc="/apps/Rlib64/")
library(parallel, lib.loc="/apps/Rlib64/")

#data(simu.datasets)

#cv.fit=alist()
#for(k in 2:5){
#  cat(paste("K=",k,sep=""),'\n')
#  cv.fit[[k]]=tune.iCluster2(simu.datasets, k, mc.cores=6)
#}

##Reproducibility index (RI) plot
#plotRI(cv.fit)

##Based on the RI plot, k=3 is the best solution
#best.fit=cv.fit[[3]]$best.fit

##Try different color schemes
#plotHeatmap(fit=best.fit,datasets=simu.datasets,
#sparse=c(TRUE,TRUE),col.scheme=list(bluered(256), greenred(256)))




