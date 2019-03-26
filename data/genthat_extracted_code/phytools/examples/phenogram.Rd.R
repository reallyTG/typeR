library(phytools)


### Name: phenogram
### Title: Plot phenogram (traitgram)
### Aliases: phenogram
### Keywords: phylogenetics plotting comparative method

### ** Examples

## Not run: 
##D tree<-pbtree(n=20,scale=2)
##D x<-fastBM(tree)
##D phenogram(tree,x)
##D # or, simulate a discrete character history
##D tree<-sim.history(tree,Q=matrix(c(-1,1,1,-1),2,2),anc="1")
##D # simulate in which the rate depends on the state
##D x<-sim.rates(tree,c(1,10))
##D phenogram(tree,x)
##D # now use spread.labels
##D tree<-pbtree(n=40)
##D x<-fastBM(tree)
##D phenogram(tree,x,spread.labels=TRUE,spread.cost=c(1,0))
## End(Not run)



