library(TunePareto)


### Name: allCombinations
### Title: Build a list of all possible combinations of parameter values
### Aliases: allCombinations
### Keywords: parameter combinations

### ** Examples


library(class)
# Combine only valid combinations of 'k' and 'l'
# for the k-NN classifier:
comb <- c(allCombinations(list(k=1,l=0)),
          allCombinations(list(k=3,l=0:2)),
          allCombinations(list(k=5,l=0:4)),
          allCombinations(list(k=7,l=0:6)))
print(comb)

print(tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.knn(),
                 parameterCombinations = comb,
                 objectiveFunctions = list(cvError(10, 10),
                                           reclassError())))



