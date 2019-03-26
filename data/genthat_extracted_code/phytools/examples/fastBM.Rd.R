library(phytools)


### Name: fastBM
### Title: (Reasonably) fast quantitative trait simulation on phylogenies
### Aliases: fastBM
### Keywords: phylogenetics simulation

### ** Examples

tree<-pbtree(n=1000)
x<-fastBM(tree,sig2=0.1) # Brownian motion
y<-fastBM(tree,mu=1) # with a trend



