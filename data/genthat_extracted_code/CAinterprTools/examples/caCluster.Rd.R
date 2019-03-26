library(CAinterprTools)


### Name: caCluster
### Title: Clustering row/column categories on the basis of Correspondence
###   Analysis coordinates from a space of user-defined dimensionality.
### Aliases: caCluster
### Keywords: caCluster

### ** Examples

data(brand_coffee)

#displays a dendrogram of row AND column categories
res <- caCluster(brand_coffee, opt.part=FALSE)

#displays a dendrogram for row AND column categories; the clustering is based on the CA 
#coordinates from a full high-dimensional space. Rectangles indicating the clusters defined by 
#the optimal partition method (see Details). A silhouette plot, a scatterplot, and a CA 
#scatterplot with indication of cluster membership are also produced (see Details). 
#The cluster membership is stored in the object 'res'.
res <- caCluster(brand_coffee, opt.part=TRUE)

#displays a dendrogram for row categories, with rectangles indicating the clusters defined by the 
#optimal partition method (see Details). The clustering is based on a space of dimensionality 4. 
#A silhouette plot, a scatterplot, and a CA scatterplot with indication of cluster membership are 
#also produced (see Details). The cluster membership is stored in the object 'res'.
 res <- caCluster(brand_coffee, which="rows", dim=4, opt.part=TRUE)

#like the above example, but the clustering is based on the coordinates on the sub-space defined 
#by a pair of dimensions (i.e., 1 and 4).
res <- caCluster(brand_coffee, which="rows", dim=c(1,4), opt.part=TRUE)




