library(adephylo)


### Name: bullseye
### Title: Fan-like phylogeny with possible representation of traits on
###   tips
### Aliases: bullseye
### Keywords: hplot multivariate

### ** Examples


if(require(ape) && require(phylobase) && require(adegenet)){

data(lizards)
tre <- read.tree(text=lizards$hprA) # make a tree

## basic plots
bullseye(tre)
bullseye(tre, lizards$traits)

## customized
par(mar=c(6,6,6,6))
bullseye(tre, lizards$traits, traits.cex=sqrt(1:7), alpha=.7,
         legend=FALSE, circ.unit=10, circ.bg=transp("black",.1),
         edge.width=2)

}




