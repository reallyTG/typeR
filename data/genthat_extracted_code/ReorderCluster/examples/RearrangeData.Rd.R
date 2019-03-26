library(ReorderCluster)


### Name: RearrangeData
### Title: Sample function to perform optimal reordering of the
###   hierarchical tree according to class labels
### Aliases: RearrangeData
### Keywords: clustering reordering

### ** Examples

data(leukemia)
rownames(leukemia)=leukemia[,1]
leukemia=leukemia[,-1]
matr=leukemia[,-101]
class=leukemia[,101]
matr=as.matrix(matr)
res=RearrangeData(matr,class)



