library(ReorderCluster)


### Name: RearrangeJoseph
### Title: Makes the initialization of auxiliary matrices and calls to
###   sequence of functions to perform the reordering of the elements
###   (leaves) of the hierarchical tree according to class labels of the
###   data objects.
### Aliases: RearrangeJoseph
### Keywords: reorder clustering backtracking

### ** Examples

data(leukemia)
rownames(leukemia)=leukemia[,1]
leukemia=leukemia[,-1]
matr=leukemia[,-101]
class=leukemia[,101]
  
matr=as.matrix(matr)
dist=dist(matr)
hc <- hclust(dist)

res<-RearrangeJoseph(hc,as.matrix(dist),class,TRUE)



