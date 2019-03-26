library(MOCCA)


### Name: analyzePareto
### Title: Analyze the Pareto-optimal cluster sizes
### Aliases: analyzePareto

### ** Examples

data(toy5)
obj <- mocca(toy5, R=10, K=2:5)
print(analyzePareto(obj$objectiveVals))



