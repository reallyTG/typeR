library(fclust)


### Name: Fclust.compare
### Title: Similarity between partitions
### Aliases: Fclust.compare
### Keywords: multivariate

### ** Examples

## Not run: 
##D require("mclust")
##D ## McDonald's data
##D data(Mc)
##D names(Mc)
##D ## data normalization by dividing the nutrition facts by the Serving Size (column 1)
##D for (j in 2:(ncol(Mc)-1))
##D Mc[,j]=Mc[,j]/Mc[,1]
##D ## removing the column Serving Size
##D Mc=Mc[,-1]
##D ## fuzzy k-means
##D ## (excluded the factor column Type (last column))
##D clust=FKM(Mc[,1:(ncol(Mc)-1)],k=6,m=1.5,stand=1)
##D ## all measures of similarity
##D classTrue=unmap(classification=Mc$Type)
##D classEst=unmap(classification=clust$clus[,1])
##D all.indexes=Fclust.compare(partHard=classTrue,partFuzzy=classEst)
##D ## fuzzy adjusted Rand index
##D Fari.index=Fclust.compare(partHard=classTrue,partFuzzy=classEst,index="ARI.F")
## End(Not run)



