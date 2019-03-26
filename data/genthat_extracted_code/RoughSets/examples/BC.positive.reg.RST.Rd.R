library(RoughSets)


### Name: BC.positive.reg.RST
### Title: Computation of a positive region
### Aliases: BC.positive.reg.RST

### ** Examples

########################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

## We select a single attribute for computation of indiscernibility classes:
A <- c(2)

## compute the indiscernibility classes:
IND.A <- BC.IND.relation.RST(hiring.data, feature.set = A)

## compute the lower and upper approximation:
roughset <- BC.LU.approximation.RST(hiring.data, IND.A)

## get the positive region:
pos.region = BC.positive.reg.RST(hiring.data, roughset)
pos.region



