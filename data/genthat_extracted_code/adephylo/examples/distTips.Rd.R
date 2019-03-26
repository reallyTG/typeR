library(adephylo)


### Name: distTips
### Title: Compute some phylogenetic distance between tips
### Aliases: distTips
### Keywords: manip

### ** Examples


if(require(ape) & require(phylobase)){
## make a tree
x <- as(rtree(10),"phylo4")
plot(x, show.node=TRUE)
axisPhylo()
## compute different distances
distTips(x, 1:3)
distTips(x, 1:3, "nNodes")
distTips(x, 1:3, "Abouheif")
distTips(x, 1:3, "sumDD")

## compare C and pure R code outputs
x <- rtree(10)
all.equal(as.matrix(distTips(x)), as.matrix(distTips(x, useC=FALSE)))
all.equal(as.matrix(distTips(x, meth="nNode")),
   as.matrix(distTips(x, meth="nNode", useC=FALSE)))
all.equal(as.matrix(distTips(x, meth="Abou")),
   as.matrix(distTips(x, meth="Abou", useC=FALSE)))
all.equal(as.matrix(distTips(x, meth="sumDD")),
   as.matrix(distTips(x, meth="sumDD", useC=FALSE)))

## compare speed
x <- rtree(50)
tim1 <- system.time(distTips(x, useC=FALSE)) # old pure R version
tim2 <- system.time(distTips(x)) # new version using C
tim1[c(1,3)]/tim2[c(1,3)] # C is about a thousand time faster in this case
}




