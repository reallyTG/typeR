library(fclust)


### Name: JACCARD.F
### Title: Fuzzy Jaccard index
### Aliases: JACCARD.F
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
##D ## fuzzy Jaccard index
##D classTrue=unmap(classification=Mc$Type)
##D classEst=unmap(classification=clust$clus[,1])
##D jaccard.f=JACCARD.F(partHard=classTrue,partFuzzy=classEst)
## End(Not run)



