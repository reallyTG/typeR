library(spider)


### Name: polyBalance
### Title: Balance of a phylogenetic tree with polytomies
### Aliases: polyBalance
### Keywords: Utilities

### ** Examples


	set.seed(55)
	tr <- ape::rtree(15)
	tr2 <- ape::di2multi(tr, tol=0.02)
	polyBalance(tr)
	polyBalance(tr2)




