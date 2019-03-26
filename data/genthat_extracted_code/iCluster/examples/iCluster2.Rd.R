library(iCluster)


### Name: iCluster2
### Title: A variant of the iCluster method with variance weighted
###   shrinkage
### Aliases: iCluster2
### Keywords: Data integration, subtype discovery, latent variable model

### ** Examples

library(iCluster)
library(caTools, lib.loc="/apps/Rlib64/")
library(gdata, lib.loc="/apps/Rlib64/")
library(gtools, lib.loc="/apps/Rlib64/")
library(gplots, lib.loc="/apps/Rlib64/")
library(lattice, lib.loc="/apps/Rlib64/")
data(gbm)

#setting the penalty parameter lambda=0 returns non-sparse fit
#fit=iCluster2(datasets=gbm, k=3, lambda=list(0.44,0.33,0.28))

#plotiCluster(fit=fit, label=rownames(gbm[[1]]))

#compute.pod(fit)

#data(coord)
#chr=coord[,1]
#plotHeatmap(fit=fit, data=gbm, feature.order=c(FALSE,TRUE,TRUE),
#sparse=c(FALSE,TRUE,TRUE),plot.chr=c(TRUE,FALSE,FALSE), chr=chr)



