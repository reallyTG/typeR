library(TunePareto)


### Name: rankByDesirability
### Title: Rank results according to their desirabilities
### Aliases: rankByDesirability
### Keywords: desirability function desirability index

### ** Examples

## No test: 
library(desire)

# optimize the 'cost' parameter of an SVM on
# the 'iris' data set
res <- tunePareto(classifier = tunePareto.svm(),
                  data = iris[, -ncol(iris)], 
                  labels = iris[, ncol(iris)],
                  cost=c(0.01,0.05,0.1,0.5,1,5,10,50,100),
                  objectiveFunctions=list(cvWeightedError(10, 10),
                                          cvSensitivity(10, 10, caseClass="setosa"),
                                          cvSpecificity(10, 10, caseClass="setosa")))
             
# create desirability functions                       
d1 <- harrington1(0.99,0.01,0.01,0.99)                                          
d2 <- harrington1(0.01,0.01,0.99,0.99)
d3 <- harrington1(0.01,0.01,0.99,0.99)

# aggregate functions in desirability index
di <- geometricDI(d1,d2,d3)

# rank all tuning results according to their desirabilities
print(rankByDesirability(res,di,optimalOnly=FALSE))
## End(No test)



