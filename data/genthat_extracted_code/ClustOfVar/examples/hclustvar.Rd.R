library(ClustOfVar)


### Name: hclustvar
### Title: Hierarchical clustering of variables
### Aliases: hclustvar
### Keywords: cluster multivariate

### ** Examples

#quantitative variables
data(decathlon)
tree <- hclustvar(X.quanti=decathlon[,1:10], init=NULL)
plot(tree)

#qualitative variables with missing values
data(vnf)
tree_NA <- hclustvar(X.quali=vnf)
plot(tree_NA)
vnf2<-na.omit(vnf)
tree <- hclustvar(X.quali=vnf2)
plot(tree)

#mixture of quantitative and qualitative variables
data(wine)
X.quanti <- PCAmixdata::splitmix(wine)$X.quanti
X.quali <- PCAmixdata::splitmix(wine)$X.quali
tree <- hclustvar(X.quanti,X.quali)
plot(tree)




