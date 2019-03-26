library(fclust)


### Name: NBA
### Title: NBA teams data
### Aliases: NBA
### Keywords: data multivariate

### ** Examples

## Not run: 
##D 
##D data(NBA)
##D ## A subset of variables is considered
##D X <- NBA[,c(4,7,10,11,12,13,14,15,16,17,20)]
##D clust.FKM=FKM(X=X,k=2:6,m=1.5,RS=50,stand=1,index="SIL.F",alpha=1)
##D summary(clust.FKM)
## End(Not run)



