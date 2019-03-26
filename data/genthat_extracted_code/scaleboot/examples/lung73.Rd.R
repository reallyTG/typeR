library(scaleboot)


### Name: lung73
### Title: Clustering of 73 Lung Tumors
### Aliases: lung73 lung73.pvclust lung73.sb
### Keywords: datasets

### ** Examples

## Not run: 
##D ## script to create lung73.pvclust and lung73.sb
##D ## multiscale bootstrap resampling of hierarchical clustering
##D library(pvclust)
##D data(lung)
##D sa <- 9^seq(-1,1,length=13) # wider range of scales than pvclust default
##D lung73.pvclust <- pvclust(lung,r=1/sa,nboot=10000) 
##D lung73.sb <- sbfit(lung73.pvclust) # model fitting
## End(Not run)

## Not run: 
##D ## Parallel version of the above script
##D ## parPvclust took 80 mins using 40 cpu's
##D library(parallel)
##D library(pvclust)
##D data(lung)
##D cl <- makeCluster(40) # launch 40 cpu's
##D sa <- 9^seq(-1,1,length=13) # wider range of scales than pvclust default
##D lung73.pvclust <- parPvclust(cl,lung,r=1/sa,nboot=10000) 
##D lung73.sb <- sbfit(lung73.pvclust,cluster=cl) # model fitting
## End(Not run)

## replace au/bp entries in pvclust object
data(lung73)
lung73.new <- sbpvclust(lung73.pvclust,lung73.sb) # au <- k.3

library(pvclust)
plot(lung73.new) # draw dendrogram with the new au/bp values
pvrect(lung73.new)

## diagnose edges 61,...,69
lung73.sb[61:69] # print fitting details
plot(lung73.sb[61:69]) # plot curve fitting
summary(lung73.sb[61:69]) # print au p-values
## diagnose edge 67
lung73.sb[[67]] # print fitting
plot(lung73.sb[[67]],legend="topleft") # plot curve fitting
summary(lung73.sb[[67]]) # print au p-values




