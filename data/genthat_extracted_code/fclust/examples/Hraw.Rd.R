library(fclust)


### Name: Hraw
### Title: Raw prototypes
### Aliases: Hraw
### Keywords: multivariate

### ** Examples

## example n.1 (k-means case)
## unemployment data
data(unemployment)
## fuzzy k-means
unempFKM=FKM(unemployment,k=3,stand=1)
## standardized prototypes
unempFKM$H
## prototypes using the original units of measurement
unempFKM$Hraw=Hraw(unempFKM$X,unempFKM$H)
## example n.2  (k-medoids case)
## unemployment data
data(unemployment)
## fuzzy k-medoids
## Not run: 
##D ## It may take more than a few seconds
##D unempFKM.med=FKM.med(unemployment,k=3,RS=10,stand=1)
##D ## prototypes using the original units of measurement:
##D ## in fuzzy k-medoids one can equivalently use
##D unempFKM.med$Hraw1=Hraw(unempFKM.med$X,unempFKM.med$H)
##D unempFKM.med$Hraw2=unempFKM.med$X[unempFKM.med$medoid,]
## End(Not run)



