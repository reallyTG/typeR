library(TunePareto)


### Name: plotParetoFronts2D
### Title: A classical 2-dimensional plot of Pareto fronts
### Aliases: plotParetoFronts2D
### Keywords: multi-objective optimization MOO Pareto front

### ** Examples

## No test: 
# optimize the 'cost' parameter according
# to CV error and CV Specificity on the 'iris' data set
r <- tunePareto(data = iris[, -ncol(iris)], 
                labels = iris[, ncol(iris)],
                classifier = tunePareto.svm(),
                cost=c(0.001,0.005,0.01,0.05,0.1,0.5,1,5,10,50), 
                objectiveFunctions=list(cvError(10, 10),
                                        cvSpecificity(10, 10, caseClass="setosa")))
                   
# plot the Pareto graph
plotParetoFronts2D(r)
## End(No test)



