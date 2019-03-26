library(microsamplingDesign)


### Name: extractByRank
### Title: extract a timepoint or Scheme choice by its rank
### Aliases: extractByRank extractByRank,SetOfSchemes,numeric-method
###   extractByRank,SetOfTimePoints,numeric-method

### ** Examples

  object        <-  getExampleSetOfSchemes()
  pkData        <-  getPkData( getExamplePkModel() , 
   getTimePoints( object ) , getNSubjects( object ) , nSamples = 10  )
  objectRanked    <- rankObject(  object ,  pkData  , data.frame(criterion = "auc" , weight = 1) ) 
 extractByRank( object = objectRanked  , rank = 1 )
 extractByRank( objectRanked  , rank = 5 )
  object                             <-  getExampleSetOfTimePoints( 0 :10 ) 
  pkData                             <-  getPkData(getExamplePkModel() ,
 getTimePoints( object ) , 1 , 5 )
objectRanked                       <-  rankObject( object , pkData , nGrid = 20,
  nSamplesAvCurve = 25 )
  extractByRank( objectRanked , 1)
  extractByRank( object = objectRanked , rank = 5 )



