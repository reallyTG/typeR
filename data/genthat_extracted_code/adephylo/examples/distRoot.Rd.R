library(adephylo)


### Name: distRoot
### Title: Compute the distance of tips to the root
### Aliases: distRoot
### Keywords: manip

### ** Examples


if(require(ape) & require(phylobase)){
## make a tree
x <- as(rtree(50),"phylo4")
## compute 4 different distances
met <- c("patristic","nNodes","Abouheif","sumDD")
D <- lapply(met, function(e) distRoot(x, method=e) )
names(D) <- met
D <- as.data.frame(D)

## plot these distances along with the tree
temp <- phylo4d(x, D)
table.phylo4d(temp, show.node=FALSE, cex.lab=.6)
}




