library(PhyInformR)


### Name: defined.multi.profile
### Title: A function to plot phylogenetic informativeness profiles based
###   on site rate cutoffs by partition
### Aliases: defined.multi.profile
### Keywords: ~kwd1 ~kwd2

### ** Examples

library("ape")
library("splines")
read.tree(system.file("extdata","Prumetal_timetree.phy",package="PhyInformR"))->tree
prumetalrates->Prates
as.matrix(Prates)->rates
lower<-c(0, 1594)
upper<-c(1595,2787)
breaks<-cbind(lower,upper)
defined.multi.profile(rates, tree, breaks, values = "off")



