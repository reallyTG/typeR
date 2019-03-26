library(treespace)


### Name: makeCollapsedTree
### Title: Collapse a tree into a single tip per category
### Aliases: makeCollapsedTree

### ** Examples

 
# simulate a tree which is monophyletic per category
tree <- simulateIndTree(rtree(5), permuteTips=FALSE)

df <- cbind(sort(rep(rtree(5)$tip.label,5)),sort(tree$tip.label))
palette <- c("red","blue","black","green","purple")#' 
tipCols <- palette[as.factor(sapply(tree$tip.label, function(l) df[which(df[,2]==l),1]))]
plot(tree, tip.color=tipCols)
collapsedTree <- makeCollapsedTree(tree,df)
plot(collapsedTree, tip.color=palette[as.factor(collapsedTree$tip.label)])

# simulate a tree which is paraphyletic per category
tree <- simulateIndTree(rtree(5), tipPercent=20)
tipCols <- palette[as.factor(sapply(tree$tip.label, function(l) df[which(df[,2]==l),1]))]
plot(tree, tip.color=tipCols)
collapsedTree <- makeCollapsedTree(tree,df)
plot(collapsedTree, tip.color=palette[as.factor(collapsedTree$tip.label)])




