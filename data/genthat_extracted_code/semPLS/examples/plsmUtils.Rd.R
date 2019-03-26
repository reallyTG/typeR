library(semPLS)


### Name: plsmUtils
### Title: Utility methods for 'plsm' objects.
### Aliases: plsmUtils plsmEdit plsmEdit.plsm addLV addLV.plsm invertLVs
###   invertLVs.plsm removeLVs removeLVs.plsm addMVs addMVs.plsm removeMVs
###   removeMVs.plsm addPath addPath.plsm removePath removePath.plsm
###   exogenous endogenous reflective formative indicators predecessors
###   successors connected acyclic

### ** Examples

data(mobi)
data(ECSIsm)
data(ECSImm)

ECSI <- plsm(data=mobi, strucmod=ECSIsm, measuremod=ECSImm)


### Some sense free examples

# Print the block of MVs associated with "Expectation".
ECSI[["blocks"]]["Expectation"]

# Change measurement model for "Expectation" from reflective to
# formative and print its block MVs
invertLVs(model=ECSI, LVs=c("Expectation"))[["blocks"]]["Expectation"]

# Print the adjacency matrix for the inner model.
ECSI[["D"]]

# Add an additional path from "Quality" to "Loyalty" and
# print the resulting adjacency matrix.
addPath(model=ECSI, from="Quality", to="Loyalty")[["D"]]

# Remove the path previously added.
removePath(model=ECSI, from="Image", to=c("Satisfaction", "Loyalty"))[["D"]]

# Print all MVs used in the model
ECSI$manifest

# Remove some MVs and print the MVs used in the model
removeMVs(model=ECSI, MVs=c("IMAG3", "CUEX1", "PERQ7"))$manifest


### some handy functions

exogenous(ECSI)
endogenous(ECSI)
reflective(ECSI)
formative(ECSI)
indicators(ECSI, "Image")
predecessors(ECSI)



