library(TunePareto)


### Name: mergeTuneParetoResults
### Title: Calculate optimal solutions from several calls of tunePareto
### Aliases: mergeTuneParetoResults
### Keywords: merge results

### ** Examples

## No test: 
# optimize an SVM with small costs on 
# the 'iris' data set
r1 <- tunePareto(classifier = tunePareto.svm(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 cost=seq(0.01,0.1,0.01),
                 objectiveFunctions=list(cvWeightedError(10, 10),
                                         cvSensitivity(10, 10, caseClass="setosa")))
print(r1)
                                         
# another call to tunePareto with higher costs
r2 <- tunePareto(classifier = tunePareto.svm(),
                 data = iris[, -ncol(iris)], 
                 labels = iris[, ncol(iris)],
                 cost=seq(0.5,10,0.5),
                 objectiveFunctions=list(cvWeightedError(10, 10),
                                         cvSensitivity(10, 10, caseClass="setosa")))
print(r2)

# merge the results
print(mergeTuneParetoResults(r1,r2))
## End(No test)



