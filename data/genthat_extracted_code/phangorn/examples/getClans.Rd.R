library(phangorn)


### Name: getClans
### Title: Clans, slices and clips
### Aliases: getClans getSlices getClips getDiversity diversity
### Keywords: cluster

### ** Examples


set.seed(111)
tree <- rtree(10)
getClans(tree)
getClips(tree, all=TRUE)
getSlices(tree)

set.seed(123)
trees <- rmtree(10, 20)
X <- matrix(sample(c("red", "blue", "violet"), 100, TRUE, c(.5,.4, .1)), 
   ncol=5, dimnames=list(paste('t',1:20, sep=""), paste('Var',1:5, sep="_")))
x <- phyDat(X, type = "USER", levels = c("red", "blue"), ambiguity="violet")
plot(trees[[1]], "u", tip.color = X[trees[[1]]$tip,1])  # intruders are blue 

(divTab <- getDiversity(trees, x, var.names=colnames(X)))
summary(divTab)




