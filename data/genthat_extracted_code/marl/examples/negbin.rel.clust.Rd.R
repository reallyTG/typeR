library(marl)


### Name: negbin.rel.clust
### Title: Relative Likelihood based clustering assuming Negative Binomial
###   distribution.
### Aliases: negbin.rel.clust
### Keywords: k.means negative.binomial

### ** Examples

x <- sim.negbin(c(4,5,10),3,10,12)
negbin.rel.clust(x,1,20,nclust = 3,len=200,plot=TRUE,seed=132)



