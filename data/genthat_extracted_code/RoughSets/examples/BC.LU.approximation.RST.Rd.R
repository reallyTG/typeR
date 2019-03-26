library(RoughSets)


### Name: BC.LU.approximation.RST
### Title: Computation of lower and upper approximations of decision
###   classes
### Aliases: BC.LU.approximation.RST

### ** Examples

#######################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

## We select a single attribute for computation of indiscernibility classes:
A <- c(2)

## Compute the indiscernibility classes:
IND.A <- BC.IND.relation.RST(hiring.data, feature.set = A)

## Compute the lower and upper approximations:
roughset <- BC.LU.approximation.RST(hiring.data, IND.A)
roughset



