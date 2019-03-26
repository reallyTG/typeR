library(MOCCA)


### Name: MOCCA-package
### Title: Multi-objective optimization for collecting cluster alternatives
### Aliases: MOCCA-package MOCCA
### Keywords: package

### ** Examples

data(toy5)
obj <- mocca(toy5, R=10, K=2:5)
print(analyzePareto(obj$objectiveVals))



