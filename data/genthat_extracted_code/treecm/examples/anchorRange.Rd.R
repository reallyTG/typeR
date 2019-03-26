library(treecm)


### Name: anchorRange
### Title: Min/max values for the anchor position along the stem
### Aliases: anchorRange

### ** Examples

library(treecm)
data(stonePine1TreeData)
vectors <- treeVectors(stonePine1TreeData)
CM <- centreOfMass(vectors)
logs <- logPathSelection(stonePine1TreeData)
anchorRange(logs, CM)



