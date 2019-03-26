library(ClustOfVar)


### Name: cutreevar
### Title: Cut a tree into groups of variables
### Aliases: cutreevar

### ** Examples

data(decathlon)
tree <- hclustvar(decathlon[,1:10])
plot(tree)
#choice of the number of clusters
stability(tree,B=40)
part <- cutreevar(tree,4)
print(part)
summary(part)




