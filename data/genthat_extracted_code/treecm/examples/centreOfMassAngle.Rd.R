library(treecm)


### Name: centreOfMassAngle
### Title: Returns the angle between CM modulus and the tree weight vector
### Aliases: centreOfMassAngle

### ** Examples

library(treecm)
data(stonePine1TreeData)
vectors <- treeVectors(stonePine1TreeData)
CM <- centreOfMass(vectors)
print(centreOfMassAngle(CM))
treeMoment <- buildTreeMomentObject(
 centreOfMassModulus(CM)
 , treeTotalBiomass(stonePine1TreeData)
 , centreOfMassAngle(CM)
 )



