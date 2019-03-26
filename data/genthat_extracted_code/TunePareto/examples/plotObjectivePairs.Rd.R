library(TunePareto)


### Name: plotObjectivePairs
### Title: Plot a matrix of Pareto front panels
### Aliases: plotObjectivePairs
### Keywords: multi-objective optimization MOO Pareto front

### ** Examples

## No test: 
# optimize the 'cost' parameter of an SVM according
# to CV error, CV error variance, and CV Specificity 
# on two classes of the 'iris' data set
r <- tunePareto(data = iris[, -ncol(iris)], 
                labels = iris[, ncol(iris)],
                classifier = tunePareto.svm(),
                cost=c(0.001,0.005,0.01,0.05,0.1,0.5,1,5,10,50), 
                objectiveFunctions=list(cvError(10, 10),
                                        cvErrorVariance(10, 10),
                                        cvSpecificity(10, 10, caseClass="virginica")))

# plot the matrix of Pareto fronts
plotObjectivePairs(r)
## End(No test)



