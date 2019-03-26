library(apTreeshape)


### Name: as.treeshape
### Title: Conversion among tree objects
### Aliases: as.treeshape as.treeshape.phylo
### Keywords: manip

### ** Examples


library(ape)
data(bird.orders)
## Data set from APE
plot(bird.orders)
  
## "treeshape" conversion
tree=as.treeshape(bird.orders)
plot(tree)
summary(tree)
 



