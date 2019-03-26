library(treecm)


### Name: centreOfMassModulus
### Title: Computes the modulus of the CM vector
### Aliases: centreOfMassModulus

### ** Examples

library(treecm)
data(stonePine1TreeData)
vectors <- treeVectors(stonePine1TreeData)
CM <- centreOfMass(object=vectors)
print(centreOfMassModulus(CM))
treeMoment <- buildTreeMomentObject(
 centreOfMassModulus(CM)
 , treeTotalBiomass(stonePine1TreeData)
 , centreOfMassAngle(CM)
 )



