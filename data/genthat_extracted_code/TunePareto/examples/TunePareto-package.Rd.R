library(TunePareto)


### Name: TunePareto-package
### Title: Multi-objective parameter tuning for classifiers
### Aliases: TunePareto-package TunePareto
### Keywords: package multi-objective parameter tuning

### ** Examples

## No test: 
# optimize the 'cost' and 'kernel' parameters of an SVM according
# to CV error and CV Specificity on the 'iris' data set
# using several predefined values for the cost
r <- tunePareto(data = iris[, -ncol(iris)], 
                labels = iris[, ncol(iris)],
                classifier=tunePareto.svm(),
                cost=c(0.001,0.01,0.1,1,10), 
                kernel=c("linear", "polynomial", 
                         "radial", "sigmoid"),
                objectiveFunctions=list(cvError(10, 10), 
                                        cvSpecificity(10, 10, caseClass="setosa")))

# print Pareto-optimal solutions
print(r)

# use a continuous interval for the 'cost' parameter 
# and optimize it using evolutionary algorithms and
# parallel execution with snowfall
library(snowfall)
sfInit(parallel=TRUE, cpus=2, type="SOCK")
r <- tunePareto(data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 classifier = tunePareto.svm(), 
                 cost = as.interval(0.001,10), 
                 kernel = c("linear", "polynomial",
                            "radial", "sigmoid"),
                 sampleType="evolution",
                 numCombinations=20,
                 numIterations=20,                      
                 objectiveFunctions = list(cvError(10, 10),
                                           cvSensitivity(10, 10, caseClass="setosa"),
                                           cvSpecificity(10, 10, caseClass="setosa")),
                useSnowfall=TRUE)
sfStop()

# print Pareto-optimal solutions
print(r)

# plot the Pareto fronts
plotDominationGraph(r, legend.x="topright")
## End(No test)



