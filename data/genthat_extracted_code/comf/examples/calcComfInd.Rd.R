library(comf)


### Name: calcComfInd
### Title: Calculating one or more Thermal Comfort Indices using a List of
###   Climatic Conditions
### Aliases: calcComfInd
### Keywords: manip

### ** Examples

## Creating list with all values
lsstrd <- createCond()

## Requesting all comfort indices
calcComfInd(lsstrd, request="all")

## Requesting a single index
calcComfInd(lsstrd, request="pmv")

## Requesting multiple indices
calcComfInd(lsstrd, request=c("pmv", "ptse"))




