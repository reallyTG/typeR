library(microsamplingDesign)


### Name: rankObjectWithRange
### Title: Rank a 'SetOfSchemes-class' or a 'SetOfTimePoints' object using
###   data generated per scneario defined by 'PkModelRange-class'
### Aliases: rankObjectWithRange

### ** Examples


  ## Not run: 
##D  # takes to much time for CRAN
##D    ## rank SetOfSchemes 
##D   setOfSchemesExample    <-  getExampleSetOfSchemes()
##D   pkModelRange           <-  getExamplePkModelRange()
##D   nSim                   <-  13 
##D   testDirectory1         <-  file.path( tempdir() , "test1" )
##D   dir.create( testDirectory1 )
##D   rankObjectWithRange( object = setOfSchemesExample , pkModelRange ,  nSim = 13  , 
##D     summaryFunctionOverScenarios = "max" ,
##D     directory  = testDirectory1 , varianceMeasure = "sd" , objective = getExampleObjective() 
##D     , nCores = 1 )
##D 
##D  
##D   ## rank set of timePoints 
##D   timePoints          <-  getExampleSetOfTimePoints( 0:10 )
##D   testDirectory2      <-  file.path( tempdir() , "test2" )
##D   dir.create( testDirectory2 )
##D   rankObjectWithRange( object = timePoints , pkModelRange ,  nSim = 13  ,
##D     summaryFunctionOverScenarios = "max" ,  directory  = testDirectory2 , nGrid = 20 , 
##D     nSamplesAvCurve = 25 , nSubjectsPerScheme = 3 
##D     , nCores = 1 )
##D   
##D   # remark : use larger number of simulation in realistic context
##D  
##D  ## clean up directories 
##D   unlink( testDirectory1 , recursive = TRUE )
##D   unlink( testDirectory2 , recursive = TRUE )
##D  
## End(Not run)



