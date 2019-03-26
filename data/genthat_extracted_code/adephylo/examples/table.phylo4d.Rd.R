library(adephylo)


### Name: table.phylo4d
### Title: Graphical display of phylogeny and traits
### Aliases: table.phylo4d
### Keywords: hplot multivariate

### ** Examples


if(require(ape) & require(phylobase) & require(ade4)){

## simulated data
tr <- rtree(20)
dat <- data.frame(a = rnorm(20), b = scale(1:20), c=runif(20,-2,2) )
dat[3:6, 2] <- NA # introduce some NAs
obj <- phylo4d(tr, dat) # build a phylo4d object
table.phylo4d(obj) # default scatterplot
table.phylo4d(obj,cex.leg=.6, use.edge.length=FALSE) # customized
table.phylo4d(obj,treetype="clad", show.node=FALSE, cex.leg=.6,
use.edge.length=FALSE, edge.color="blue", edge.width=3) # more customized


## teleost fishes data
data(mjrochet)
temp <- read.tree(text=mjrochet$tre) # make a tree
mjr <- phylo4d(x=temp,tip.data=mjrochet$tab) # male a phylo4d object
table.phylo4d(mjr,cex.lab=.5,show.node=FALSE,symb="square")


## lizards data
data(lizards)
liz.tr <- read.tree(tex=lizards$hprA) # make a tree
liz <- phylo4d(liz.tr, lizards$traits) # make a phylo4d object
table.phylo4d(liz)


## plotting principal components
liz.pca1 <- dudi.pca(lizards$traits, scannf=FALSE, nf=2) # PCA of traits
myPC <- phylo4d(liz.tr, liz.pca1$li) # store PC in a phylo4d object
varlab <- paste("Principal \ncomponent", 1:2) # make labels for PCs
table.phylo4d(myPC, ratio=.8, var.lab=varlab) # plot the PCs
add.scatter.eig(liz.pca1$eig,2,1,2,posi="topleft", inset=c(0,.15))
title("Phylogeny and the principal components")

}




