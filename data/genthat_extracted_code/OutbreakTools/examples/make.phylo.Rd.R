library(OutbreakTools)


### Name: make.phylo
### Title: Obtain phylogenies from outbreak data
### Aliases: make.phylo make.phylo,obkData-method make.phylo.obkData
### Keywords: classes

### ** Examples


## Example using simulate outbreak ##

set.seed(3)
x <- simuEpi(N = 200, D = 20, beta = 0.002, nu = 0.1, mu = 0.002)$x
get.trees(x) # no tree here

## GET TREE AND DISPLAY IT
x <- make.phylo(x, plot=TRUE)
get.trees(x) # newly created trees


## DISPLAY TREE USING PLOTGGPHY

## root tree to first case ##
if(require(ape)){
tre <- root(get.trees(x)[[1]],1)
}

## plot tree, use color for dates ##
par(mar=c(1,1,4,1))
plot(tre, edge.width=2, type="fan", show.tip=FALSE)
title("NJ tree of a simulated outbreak")
mtext("each disk indicates 1 mutation from the root")




