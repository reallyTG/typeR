library(PhyInformR)


### Name: multi.profile
### Title: A function to plot phylogenetic informativeness profiles based
###   on site rate cutoffs by rate
### Aliases: multi.profile
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("ape")
library("splines")
read.tree(system.file("extdata","polypterus_trees.phy",package="PhyInformR"))->trees
trees[[1]]->tree
as.matrix(rag1)->rates
lower<-c(0.,0.003)
upper<-c(0.003000000001,10)
breaks<-cbind(lower,upper)
multi.profile(rates, tree, breaks, values = "off")



