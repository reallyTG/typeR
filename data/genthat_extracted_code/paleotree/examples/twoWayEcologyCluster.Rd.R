library(paleotree)


### Name: twoWayEcologyCluster
### Title: R-Mode vs Q-Mode Two-Way Cluster Analyses and Abundance Plot for
###   Community Ecology Data
### Aliases: twoWayEcologyCluster

### ** Examples

## Not run: 
##D library(vegan)
##D 
##D # generate random community ecology data
##D 	# using a Poisson distribution
##D data<-matrix(rpois(5*7,1),5,7)
##D 
##D # relative abundance, distance matrices
##D propAbundMat<-t(apply(data,1,function(x) x/sum(x)))
##D rownames(propAbundMat)<-paste0("x", 1:nrow(propAbundMat))
##D colnames(propAbundMat)<-paste0("y", 1:ncol(propAbundMat))
##D 
##D siteDist<-vegdist(propAbundMat, "bray")
##D taxaDist<-vegdist(t(propAbundMat), "bray")
##D 
##D dev.new(width=10)	
##D 
##D twoWayEcologyCluster(
##D 	xDist = siteDist, 
##D 	yDist = taxaDist,
##D 	propAbund = propAbundMat
##D 	)
##D 
##D ##############################################	
##D 
##D # now let's try an example with some pokemon data
##D data(kanto)
##D 
##D # get distance matrices for sites and taxa
##D 	# based on bray-curtis dist
##D 	# standardized to total abundance
##D 
##D # standardize site matrix to relative abundance
##D siteStand <- decostand(kanto, method = "total")
##D 
##D # calculate site distance matrix (Bray-Curtis)
##D siteDist <- vegdist(siteStand, "bray")
##D 
##D # calculate taxa distance matrix (Bray-Curtis)
##D 	# from transposed standardized site matrix 
##D taxaDist <- vegdist(t(siteStand), "bray")
##D 
##D dev.new(width=10)	
##D 
##D twoWayEcologyCluster(
##D     xDist = siteDist,
##D     yDist = taxaDist,
##D     propAbund = siteStand
##D     )
## End(Not run)



