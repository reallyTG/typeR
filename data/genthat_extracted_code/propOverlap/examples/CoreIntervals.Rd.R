library(propOverlap)


### Name: CI.emprical
### Title: Computing the Core Intervals for Both Classes.
### Aliases: CI.emprical
### Keywords: robust univar

### ** Examples

data(lung)
GenesExpression <- lung[1:12533,]   #define the features matrix
Class           <- lung[12534,]     #define the observations' class labels
CoreIntervals   <- CI.emprical(GenesExpression, Class)
CoreIntervals[1:10,]                #show classes' core interval for the first 10 features



