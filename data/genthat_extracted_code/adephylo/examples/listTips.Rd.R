library(adephylo)


### Name: listTips
### Title: List tips descendings from all nodes of a tree
### Aliases: listTips
### Keywords: manip

### ** Examples


if(require(ape) & require(phylobase)){
## make a tree
x <- as(rtree(20),"phylo4")
plot(x,show.node=TRUE)
listTips(x)
}




