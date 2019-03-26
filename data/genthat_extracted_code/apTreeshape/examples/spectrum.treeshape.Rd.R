library(apTreeshape)


### Name: spectrum.treeshape
### Title: Compute the spectrum of a tree
### Aliases: spectrum.treeshape
### Keywords: univar

### ** Examples


## A random Yule tree with 30 tips
tr<-rtreeshape(n=1,tip.number=30,model="yule")
tr<-tr[[1]]
spectre=spectrum.treeshape(tr)
spectre
  
## Number of cherries of the tree : nrow(tr$merge)==29
spectre[29]



