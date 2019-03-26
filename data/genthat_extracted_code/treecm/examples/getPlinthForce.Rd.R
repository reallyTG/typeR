library(treecm)


### Name: getPlinthForce
### Title: Computes the force on the plinth on the ground
### Aliases: getPlinthForce

### ** Examples

library(treecm)
data(stonePine1TreeData)
vectors <- treeVectors(stonePine1TreeData)
CM <- centreOfMass(vectors)
treeMoment <- buildTreeMomentObject(
  centreOfMassModulus(CM)
  , treeTotalBiomass(stonePine1TreeData)
  , centreOfMassAngle(CM)
  )
treeMoment <- calcMoment(treeMoment)
logs <- logPathSelection(stonePine1TreeData)
plinth <- data.frame(getPlinthForce(10, 20, logs, getMoment(treeMoment), CM))



