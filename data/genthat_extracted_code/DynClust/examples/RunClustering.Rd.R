library(DynClust)


### Name: RunClustering
### Title: Clustering of a dynamical image sequence
### Aliases: RunClustering

### ** Examples


## Not run: 
##D     library(DynClust)
##D     
##D     ## use fluorescence calcium imaging of neurons performed with Fura 2 excited at 340 nm
##D     data('adu340_4small',package='DynClust')
##D     
##D     ## Gain of the CCD camera:
##D     G <- 0.146
##D     ## readout variance of the CCD camera:
##D     sro2 <- (16.4)^2
##D     ## Stabilization of the variance to get a normalized dataset (variance=1)
##D     FT <- 2*sqrt(adu340_4small/G + sro2)
##D     FT.range = range(FT)
##D     
##D     ## launches the denoising step on the dataset with a statistical level of 5%
##D     FT.den.tmp <- RunDenoising(FT,1,mask.size=NA,nproc=2)
##D     
##D     ## launches the clustering step on the dataset with a statistical level of 5%
##D     FT.clust.tmp  <- RunClustering(FT,FT.den.tmp,nproc=2)
##D     n.cluster <- length(FT.clust.tmp$clusters)
##D     print(paste(n.cluster,'clusters using variance set to',sqrt(FT.den.tmp$var),'^2'))
##D     
##D     ## get the classified version of the data array and the map of the clusters
##D     FT.clust.res <- GetClusteringResults(FT,FT.den.tmp,FT.clust.tmp)
##D     
##D     ## plotting results of the clusterization
##D     par(mfrow=c(2,2))
##D     image(FT.clust.res$clust.map,col=rainbow(n.cluster))
##D     title('Cluster map')
##D     matplot(FT.clust.res$clust.center,col=rainbow(n.cluster),type="l",lwd=0.1,lty=1)
##D     title('Cluster centers')
##D 
##D     ## and more: original and clustered slices at time 50
##D     image(FT[,,50],zlim=FT.range,col=grey(seq(0,1,length=n.cluster)))
##D     title('Original sequence at time 50')
##D     image(FT.clust.res$clust.array[,,50],zlim=FT.range,col=grey(seq(0,1,length=n.cluster)))
##D     title('Clustered sequence at time 50')
##D 
##D     ####################################################################################
##D     ## reapply clustering with twice the nominal variance: forces stronger clustering ##
##D     ####################################################################################
##D 
##D     ## launches the denoising step on the dataset with a statistical level of 5%
##D     FT.den.tmp <- RunDenoising(FT,2,mask.size=NA,nproc=2)
##D 
##D     ## launches the clustering step on the dataset with a statistical level of 5%
##D     FT.clust.tmp  <- RunClustering(FT,FT.den.tmp,nproc=2)
##D     n.cluster <- length(FT.clust.tmp$clusters)
##D     print(paste(n.cluster,'clusters using twice the nominal variance'))
##D     
##D     ## get the classified version of the data array and the map of the clusters
##D     FT.clust.res <- GetClusteringResults(FT,FT.den.tmp,FT.clust.tmp)
##D     
##D     ## plotting results of the clusterization
##D     par(mfrow=c(2,2))
##D     image(FT.clust.res$clust.map,col=rainbow(n.cluster))
##D     title('Cluster map')
##D     matplot(FT.clust.res$clust.center,col=rainbow(n.cluster),type="l",lwd=0.1,lty=1)
##D     title('Cluster centers')
##D 
##D     ## and more: original and clustered slices at time 50
##D     image(FT[,,50],zlim=FT.range,col=grey(seq(0,1,length=n.cluster)))
##D     title('Original sequence at time 50')
##D     image(FT.clust.res$clust.array[,,50],zlim=FT.range,col=grey(seq(0,1,length=n.cluster)))
##D     title('Clustered sequence at time 50')
## End(Not run)



