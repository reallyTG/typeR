library(phangorn)


### Name: add.tips
### Title: Add tips to a tree
### Aliases: add.tips
### Keywords: cluster

### ** Examples


tree <- rcoal(10)
plot(tree)
nodelabels()
tiplabels()
tree1 <- add.tips(tree, c("A", "B", "C"), c(1,2,15)) 
plot(tree1) 



