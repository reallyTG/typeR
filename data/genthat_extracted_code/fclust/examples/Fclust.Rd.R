library(fclust)


### Name: Fclust
### Title: Interactive fuzzy clustering analysis
### Aliases: Fclust
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
##D ## interactive fuzzy clustering
##D ## (excluded the factor column Type (last column))
##D ##clust=Fclust(Mc[,1:(ncol(Mc)-1)])
## End(Not run)



