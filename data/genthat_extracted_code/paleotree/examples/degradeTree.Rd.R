library(paleotree)


### Name: degradeTree
### Title: Randomly Collapse a Portion of Nodes on a Phylogeny
### Aliases: degradeTree collapseNodes

### ** Examples


set.seed(444)
tree <- rtree(100)
tree1 <- degradeTree(tree,prop_collapse = 0.5) 
tree3 <- degradeTree(tree,nCollapse = 50) 

#let's compare the input and output
layout(matrix(1:2,,2))
plot(tree,show.tip.label = FALSE,use.edge.length = FALSE)
plot(tree1,show.tip.label = FALSE,use.edge.length = FALSE)

#now with collapseNodes
tree <- rtree(10)
#collapse nodes backwards
   #let's collapse lucky node number 13!
tree1 <- collapseNodes(nodeID = 13,tree = tree,collapseType = "backward")  
#collapse nodes forwards 
tree2 <- collapseNodes(nodeID = 13,tree = tree,collapseType = "forward")
#collapse entire clade
tree3 <- collapseNodes(nodeID = 13,tree = tree,collapseType = "clade")

#let's compare
layout(1:4)
plot(tree,use.edge.length = FALSE,main = "original")
plot(tree1,use.edge.length = FALSE,main = "backward collapse")
plot(tree2,use.edge.length = FALSE,main = "forward collapse")
plot(tree3,use.edge.length = FALSE,main = "entire clade")

layout(1)




