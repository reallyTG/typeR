library(PhyInformR)


### Name: plotPosterior
### Title: A function to visualize outputs of QIRP, QIHP, and QIPP computed
###   across a distribution of trees
### Aliases: plotPosterior
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("ape")
read.tree(system.file("extdata","polypterus_trees.phy",package="PhyInformR"))->trees
trees<-trees[1:10]
as.matrix(rag1)->rates
quart<-c("Polypterus_congicus", "Polypterus_bichir", 
"Polypterus_ansorgii", "Polypterus_endlicheri")
a<-1
b<-1
c<-1
d<-1
e<-1
f<-1
Pi_T<-.25
Pi_C<-.25
Pi_A<-.25
Pi_G<-.25
##Not run
#su.bayes(a,b,c,d,e,f, Pi_T, Pi_C, Pi_A, Pi_G, rates, quart, trees)->final
#plotPosterior(final, plotType='violin')
##



