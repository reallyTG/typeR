library(TunePareto)


### Name: precalculation
### Title: Predefined precalculation functions for objectives
### Aliases: precalculation reclassification crossValidation
### Keywords: objective function multi-objective optimization MOO

### ** Examples

## No test: 
# create new objective minimizing the
# false positives of a reclassification

cvFalsePositives <- function(nfold=10, ntimes=10, leaveOneOut=FALSE, foldList=NULL, caseClass)
{
  return(createObjective(
            precalculationFunction = "crossValidation",
            precalculationParams = list(nfold=nfold, 
                                        ntimes=ntimes, 
                                        leaveOneOut=leaveOneOut,
                                        foldList=foldList),
            objectiveFunction = 
            function(result, caseClass)
            {
             
              # take mean value over the cv runs
              return(mean(sapply(result,
                    function(run)
                    # iterate over runs of cross-validation
                    {
                      # extract all predicted labels in the folds
                      predictedLabels <- 
                            unlist(lapply(run,
                                         function(fold)fold$predictedLabels))
    
                      # extract all true labels in the folds
                      trueLabels <- 
                            unlist(lapply(run,
                                          function(fold)fold$trueLabels))
                      
                      # calculate number of false positives in the run
                      return(sum(predictedLabels == caseClass & 
                                 trueLabels != caseClass))
                    })))
            },
            objectiveFunctionParams = list(caseClass=caseClass),
            direction = "minimize",        
            name = "CV.FalsePositives"))                  
}

# use the objective in an SVM cost parameter tuning on the 'iris' data set
r <- tunePareto(data = iris[, -ncol(iris)], 
                labels = iris[, ncol(iris)],
                classifier = tunePareto.svm(),
                cost = c(0.001,0.005,0.01,0.05,0.1,0.5,1,5,10,50),
                objectiveFunctions=list(cvFalsePositives(10, 10, caseClass="setosa")))
print(r)
## End(No test)



