library(microsamplingDesign)


### Name: rankObject
### Title: generic function to calulate a 'ranking'-slot
### Aliases: rankObject fastRankSchemes rankObject,SetOfSchemes-method
###   rankObject,SetOfTimePoints-method
### Keywords: export

### ** Examples

## Not run: 
##D   setOfSchemes             <-  getExampleSetOfSchemes()
##D   dataForSchemes            <-  getExampleData()
##D   ex1       <-  rankObject( object = setOfSchemes, dataForSchemes ,
##D     objective = data.frame( criterion = "auc" , weight = 1 ) )
##D   getRanking(ex1) # to get the dataframe and not the whole object
##D   ex2       <-  rankObject( object = setOfSchemes, dataForSchemes ,
##D     objective = data.frame( criterion = "auc" , weight = 1 )  ,
##D     varianceMeasure = "sd" , scaleWith = "min" ) 
##D   getRanking(ex2) 
##D   ex3       <-  rankObject( object = setOfSchemes, dataForSchemes ,
##D     objective = data.frame( criterion = c( "auc" , "cMax" , "tMax" )  ,
##D      weight = c( 9 , 1, 1 ) ) ) 
##D   getRanking(ex3)
##D 
##D   # example with own defined varianceMeasure
##D   rangeWidth     <-  function( x ){
##D      range <-  range(x) ;
##D      rangeWith  <-  range[2] - range[1]; rangeWith
##D    }
##D   ex4       <-  rankObject( object = setOfSchemes, dataForSchemes , 
##D       objective = data.frame( criterion = c( "auc" , "cMax" , "tMax" )  , 
##D       weight = c( 9 , 1, 1 ) ) ,
##D       varianceMeasure = "rangeWidth" ,
##D       scaleWith = "mean" ) 
## End(Not run)
## Not run: 
##D  fullTimePoints    <-  0:10
##D  setOfTimePoints   <-  getExampleSetOfTimePoints( fullTimePoints)
##D  pkDataExample     <-  getPkData( getExamplePkModel() , getTimePoints( setOfTimePoints ) , 
##D    nSubjectsPerScheme = 5 , nSamples = 17   )
##D  ex1               <-  rankObject( object = setOfTimePoints , pkData = pkDataExample ,
##D      nGrid = 75 , nSamplesAvCurve = 13)
##D  ex2               <-  rankObject( object = setOfTimePoints ,   pkData = pkDataExample , 
##D      nGrid = 75 , nSamplesAvCurve = 13 , useAverageRat = TRUE )
##D  ex3               <-  rankObject( object = setOfTimePoints ,   pkData = pkDataExample ,
##D      nGrid = 75 , avCurve = rep(0 , length(fullTimePoints) ) )
## End(Not run)



