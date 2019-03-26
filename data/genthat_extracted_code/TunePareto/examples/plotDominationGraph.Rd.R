library(TunePareto)


### Name: plotDominationGraph
### Title: Visualize the Pareto fronts of parameter configuration scores
### Aliases: plotDominationGraph
### Keywords: Pareto front domination graph objective function

### ** Examples

# call tunePareto using a k-NN classifier 
# with different 'k' and 'l' on the 'iris' data set
x <- tunePareto(data = iris[, -ncol(iris)], 
                labels = iris[, ncol(iris)],
                classifier = tunePareto.knn(),
                k = c(5,7,9),
                l = c(1,2,3),
                objectiveFunctions=list(cvError(10, 10),
                                        cvSpecificity(10, 10, caseClass="setosa")))

# plot the graph                 
## No test: 
plotDominationGraph(x)
## End(No test)



