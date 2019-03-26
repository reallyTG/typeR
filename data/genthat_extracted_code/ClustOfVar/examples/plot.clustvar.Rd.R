library(ClustOfVar)


### Name: plot.clustvar
### Title: Plot loadings in each cluster.
### Aliases: plot.clustvar

### ** Examples

data(wine)
X.quanti <- PCAmixdata::splitmix(wine)$X.quanti
X.quali <- PCAmixdata::splitmix(wine)$X.quali
tree <- hclustvar(X.quanti,X.quali)
tree.cut<-cutreevar(tree,6)

#plot of scores on synthetic variables
res.plot <- plot(tree.cut)
res.plot$coord.quanti
res.plot$coord.levels



