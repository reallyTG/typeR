library(microsamplingDesign)


### Name: getSetOfSchemes
### Title: Generate a 'SetOfSchemes-class' object of speficified dimensions
###   ( subjects, observations per t) for a given set of time points which
###   meets user specified constraints
### Aliases: getSetOfSchemes

### ** Examples

  timePoints          <-  c( 1.2 , 1.3 ,  2, 5  )
  constraints         <-  getConstraintsExample()
  ex1   <-  getSetOfSchemes( minNSubjects = 4 , maxNSubjects = 4 ,
    minObsPerSubject = 3 , maxObsPerSubject = 3 , timePoints , constraints )
  ex2   <-  getSetOfSchemes( minNSubjects = 4 , maxNSubjects = 4 ,
    minObsPerSubject = 3 , maxObsPerSubject = 3 , timePoints ,
    constraints ,  maxRepetitionIndSchemes = 1 )
  ex3   <-  getSetOfSchemes( minNSubjects = 4 , maxNSubjects = 4 , 
    minObsPerSubject = 2 , maxObsPerSubject = 3 , timePoints ,
    constraints , maxRepetitionIndSchemes = 1 )
  ex4   <-  getSetOfSchemes( minNSubjects = 2 , maxNSubjects = 5 ,
    minObsPerSubject = 2 , maxObsPerSubject = 3 , timePoints ,
    constraints , maxRepetitionIndSchemes = 1 )
  ex5   <-  getSetOfSchemes( minNSubjects = 2 , maxNSubjects = 5 ,
    minObsPerSubject = 2 , maxObsPerSubject = 3 , timePoints , 
    maxRepetitionIndSchemes = 2 )
  ## Not run: 
##D     # this should trow an error (to many combinations required )
##D     ex6   <-  getSetOfSchemes( minNSubjects = 2 , maxNSubjects = 5 , 
##D        minObsPerSubject = 2 ,  maxObsPerSubject = 3 , timePoints ,
##D        maxRepetitionIndSchemes = 2 ,  maxNumberOfSchemesBeforeChecks = 1000 )
## End(Not run)



