library(rfUtilities)


### Name: rf.unsupervised
### Title: Unsupervised Random Forests
### Aliases: rf.unsupervised

### ** Examples

 library(randomForest) 
 data(iris)
 n = 4
 clust.iris <- rf.unsupervised(iris[,1:4], n=n, proximity = TRUE, 
                               silhouettes = TRUE)
 clust.iris$k

 mds <- stats:::cmdscale(clust.iris$distances, eig=TRUE, k=n)
   colnames(mds$points) <- paste("Dim", 1:n)
   mds.col <- ifelse(clust.iris$k == 1, rainbow(4)[1],
                ifelse(clust.iris$k == 2, rainbow(4)[2],
 			     ifelse(clust.iris$k == 3, rainbow(4)[3],
 				   ifelse(clust.iris$k == 4, rainbow(4)[4], NA))))
 plot(mds$points[,1:2],col=mds.col, pch=20) 				   
 pairs(mds$points, col=mds.col, pch=20)
  



