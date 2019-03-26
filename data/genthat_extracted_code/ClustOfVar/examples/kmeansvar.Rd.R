library(ClustOfVar)


### Name: kmeansvar
### Title: k-means clustering of variables
### Aliases: kmeansvar
### Keywords: cluster multivariate

### ** Examples

data(decathlon)
#choice of the number of clusters
tree <- hclustvar(X.quanti=decathlon[,1:10])
stab <- stability(tree,B=60)
#a random set of variables is chosen as the initial cluster centers, nstart=10 times
part1 <- kmeansvar(X.quanti=decathlon[,1:10],init=5,nstart=10)
summary(part1)
#the partition from the hierarchical clustering is chosen as initial partition
part_init<-cutreevar(tree,5)$cluster
part2<-kmeansvar(X.quanti=decathlon[,1:10],init=part_init,matsim=TRUE)
summary(part2)
part2$sim




