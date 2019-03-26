library(ClustOfVar)


### Name: plot.hclustvar
### Title: Dendrogram of the hierarchy of variables
### Aliases: plot.hclustvar

### ** Examples

data(wine)
X.quanti <- PCAmixdata::splitmix(wine)$X.quanti
X.quali <- PCAmixdata::splitmix(wine)$X.quali
tree <- hclustvar(X.quanti,X.quali)
plot(tree)

#Aggregation levels plot
plot(tree,type="index")




