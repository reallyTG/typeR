library(adephylo)


### Name: proxTips
### Title: Compute some phylogenetic proximities between tips
### Aliases: proxTips
### Keywords: manip

### ** Examples


if(require(ape) & require(phylobase)){
## make a tree
x <- as(rtree(10),"phylo4")
plot(x, show.node=TRUE)
axisPhylo()
## compute different distances
proxTips(x, 1:5)
proxTips(x, 1:5, "nNodes")
proxTips(x, 1:5, "Abouheif")
proxTips(x, , "sumDD")

## see what one proximity looks like
M <- proxTips(x)
obj <- phylo4d(x,as.data.frame(M))
table.phylo4d(obj,symbol="sq")
}




