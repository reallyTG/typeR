library(RoughSets)


### Name: BC.discernibility.mat.RST
### Title: Computation of a decision-relative discernibility matrix based
###   on the rough set theory
### Aliases: BC.discernibility.mat.RST

### ** Examples

#######################################################################
## Example 1: Constructing the decision-relative discernibility matrix
#######################################################################
data(RoughSetData)
hiring.data <- RoughSetData$hiring.dt

## building the decision-relation discernibility matrix
disc.matrix <- BC.discernibility.mat.RST(hiring.data, return.matrix = TRUE)
disc.matrix



