library(paleotree)


### Name: minBranchLength
### Title: Scales Edge Lengths of a Phylogeny to a Minimum Branch Length
### Aliases: minBranchLength

### ** Examples


#simulation with an example non-ultrametric tree

tree <- rtree(20)
# randomly replace edges with ZLBs, similar to multi2di output
tree <- degradeTree(tree,0.3,leave.zlb = TRUE) 	

tree2 <- minBranchLength(tree,0.1)

layout(1:2)
plot(tree);axisPhylo()
plot(tree2);axisPhylo()

layout(1)

#now let's try it with an ultrametric case

# get a random tree
tree <- rtree(30)
# randomly replace edges with ZLBs, similar to multi2di output
tree <- degradeTree(tree,0.5,leave.zlb = TRUE) 
# now randomly resolve	
tree <- di2multi(tree)
# give branch lengths so its ultrametric
tree <- compute.brlen(tree)

plot(tree) #and we have an ultrametric tree with polytomies, yay!

#now randomly resolve, get new branch lengths as would with real data
tree2 <- multi2di(tree)
tree2 <- minBranchLength(tree2,0.1)

layout(1:2)
plot(tree,show.tip.label = FALSE);axisPhylo()
plot(tree2,show.tip.label = FALSE);axisPhylo()

layout(1)



