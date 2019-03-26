library(apTreeshape)


### Name: tipsubtree
### Title: Extract a subtree that contains pre-specified tip names or
###   labels
### Aliases: tipsubtree
### Keywords: manip

### ** Examples

  
## The universal tree of life provided in the data sets.
data(universal.treeshape)
  
## One might want to extract the tree containing the Animals, the Plants,
##      the Aquifex and the Microsporidia
tree1<-tipsubtree(universal.treeshape,tips=c("Animals", "Aquifex", 
      "Microsporidia", "Plants"))
plot(universal.treeshape, tree1)

## Labels that do not appear in the tree are ignored
tree2<-tipsubtree(universal.treeshape,tips=c("Human", "Animals", "Aquifex", 
      "Microsporidia", "Plants"))
plot(universal.treeshape, tree2)
  
tree3<-tipsubtree(universal.treeshape,tips=c(1,3,7), numeric=TRUE)
plot(universal.treeshape, tree3)



