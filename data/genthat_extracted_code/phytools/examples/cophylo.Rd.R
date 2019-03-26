library(phytools)


### Name: cophylo
### Title: Creates a co-phylogenetic plot
### Aliases: cophylo plot.cophylo
### Keywords: phylogenetics plotting

### ** Examples

tr1<-pbtree(n=26,tip.label=LETTERS)
tr2<-pbtree(n=26,tip.label=sample(LETTERS))
obj<-cophylo(tr1,tr2)
plot(obj)



