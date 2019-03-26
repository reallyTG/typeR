library(adephylo)


### Name: listDD
### Title: List direct descendants for all nodes of a tree
### Aliases: listDD
### Keywords: manip

### ** Examples


if(require(ape) & require(phylobase)){
## make a tree
x <- as(rtree(20),"phylo4")
plot(x,show.node=TRUE)
listDD(x)
}




