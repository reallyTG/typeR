library(fclust)


### Name: FKM.med
### Title: Fuzzy k-medoids
### Aliases: FKM.med
### Keywords: multivariate

### ** Examples

## Not run: 
##D ## McDonald's data
##D data(Mc)
##D names(Mc)
##D ## data normalization by dividing the nutrition facts by the Serving Size (column 1)
##D for (j in 2:(ncol(Mc)-1))
##D Mc[,j]=Mc[,j]/Mc[,1]
##D ## removing the column Serving Size
##D Mc=Mc[,-1]
##D ## fuzzy k-medoids, fixing the number of clusters
##D ## (excluded the factor column Type (last column))
##D clust=FKM.med(Mc[,1:(ncol(Mc)-1)],k=6,m=1.1,RS=10,stand=1)
##D ## fuzzy k-medoids, selecting the number of clusters
##D ## (excluded the factor column Type (last column))
##D clust=FKM.med(Mc[,1:(ncol(Mc)-1)],k=2:6,m=1.1,RS=10,stand=1)
## End(Not run)



