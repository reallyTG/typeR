library(RoughSets)


### Name: BC.IND.relation.RST
### Title: Computation of indiscernibility classes based on the rough set
###   theory
### Aliases: BC.IND.relation.RST

### ** Examples

#############################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

## In this case, we only consider the second and third attribute:
A <- c(2,3)
## We can also compute a decision reduct:
B <- FS.reduct.computation(hiring.data)

## Compute the indiscernibility classes:
IND.A <- BC.IND.relation.RST(hiring.data, feature.set = A)
IND.A

IND.B <- BC.IND.relation.RST(hiring.data, feature.set = B)
IND.B



