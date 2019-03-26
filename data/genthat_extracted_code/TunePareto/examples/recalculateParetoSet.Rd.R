library(TunePareto)


### Name: recalculateParetoSet
### Title: Recalculate Pareto-optimal solutions
### Aliases: recalculateParetoSet
### Keywords: subset of objectives

### ** Examples

## No test: 
# optimize the 'cost' parameter of an SVM on
# the 'iris' data set
res <- tunePareto(classifier = tunePareto.svm(),
                  data = iris[, -ncol(iris)], 
                  labels = iris[, ncol(iris)],
                  cost=seq(0.01,0.1,0.01),
                  objectiveFunctions=list(cvWeightedError(10, 10),
                                          cvSensitivity(10, 10, caseClass="setosa"),
                                          cvSpecificity(10, 10, caseClass="setosa")))
print(res)

# select only specificity and sensitivity
print(recalculateParetoSet(res, 2:3))
## End(No test)



