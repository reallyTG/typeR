## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ------------------------------------------------------------------------
knitr::opts_chunk$set(fig.width=12 )

## ---- echo = TRUE, message = FALSE, eval = FALSE-------------------------
#  library( microsamplingDesign )
#  runMicrosamplingDesignApp( installDependencies = TRUE )

## ----constructModel, echo = FALSE , fig.cap  = "Construct a PK model" , out.width = "500px" , fig.align = "center"----
knitr::include_graphics( "appPictures/modifyParameters.png" )

## ----sampleCurves, echo = FALSE , fig.cap  = "Check model by generating example curves" , out.width = "500px" , fig.align = "center"----
knitr::include_graphics( "appPictures/sampleCurves.png" )

## ----generateTime, echo = FALSE , fig.cap  = "Generate time points",out.width = "500px" , fig.align = "center"----
knitr::include_graphics( "appPictures/generateTimePoints.png" )

## ----rankTime1, echo = FALSE , fig.cap  = "Generate data to rank time points", out.width = "500px", fig.align = "center"----
knitr::include_graphics( "appPictures/rankTimePoints1.png" )

## ----rankTime2, echo = FALSE , fig.cap  = "Rank time points and select one",out.width = "500px", fig.align = "center"----
knitr::include_graphics( "appPictures/rankTimePoints2.png" )

## ----generateSchemes, echo = FALSE , fig.cap  = "Generate schemes", out.width = "500px", fig.align = "center"----
knitr::include_graphics( "appPictures/generateSchemes.png" )

## ----rankSchemes1, echo = FALSE , fig.cap  = "Generate data to rank schemes", out.width = "500px" , fig.align = "center"----
knitr::include_graphics( "appPictures/rankSchemes1.png" )

## ----rankSchemes2, echo = FALSE , fig.cap  = "Rank schemes", out.width = "500px" , , fig.align = "center"----
knitr::include_graphics( "appPictures/rankSchemes2.png" )

## ---- echo = TRUE, message = FALSE, results = TRUE , eval = TRUE---------
settings                <-  list()
settings$nSamples       <-  100 # increase for real life example 
set.seed(124)

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
library( microsamplingDesign )
pkModel                <- getExamplePkModel()

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
modelParameters      <-  getParameters( pkModel ) 
knitr::kable( modelParameters[ , c(1:2) ] )

## ---- echo = TRUE, eval = FALSE , message = FALSE, results = TRUE--------
#  ?construct2CompModel

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
fullTimePointsEx     <-  seq( 0 , 16 , 0.5 )
print( fullTimePointsEx )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
#timeZonesEx         <-  getExampleTimeZones()
timeZonesEx          <-  data.frame( startTime = c( 0 , 2 , 3 ) ,
  endTime = c( 2 , 3 , 16 ) ,
  nPointsPerZone = c( 2 , 1 , 2 )  )
knitr::kable( timeZonesEx )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
setOfTimePoints          <-  getAllTimeOptions( timeZones = timeZonesEx ,
    fullTimePoints = fullTimePointsEx )
# ?SetOfTimePoints   # class definition
#str( setOfTimePoints ) # to see all slots in the example
slotNames( setOfTimePoints  )

knitr::kable( head( getData( setOfTimePoints) ) )
knitr::kable( tail( getData( setOfTimePoints) ) )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
model               <-  getExamplePkModel() 
fullTimePoints      <-  getTimePoints( setOfTimePoints )
pkDataForTimePoints <-  getPkData( pkModel = model , timePoints = fullTimePoints ,
  nSubjectsPerScheme = 5 , nSamples = settings$nSamples  ) 
plotObject( pkDataForTimePoints , nCurves = 5 )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
rankedTimePoints      <-  rankObject( setOfTimePoints , pkData = pkDataForTimePoints , 
		nGrid =  150 , nSamplesAvCurve = settings$nSamples ) 
rankingTimePoints     <-  getRanking( rankedTimePoints )
knitr::kable( head( rankingTimePoints ) )
#knitr::kable( tail( rankingTimePoints ) )
indTimeChoice         <-  getTopNRanking( rankingTimePoints , 1  )
bestTimeChoice        <-  setOfTimePoints[ indTimeChoice ,  ]
bestTimeChoice

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
timePointsChoice      <-  bestTimeChoice

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
constraintsExample    <-  getConstraintsExample()[c( 2 , 4 ) , ]
knitr::kable( constraintsExample )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
setOfSchemes          <-  getSetOfSchemes( minNSubjects = 4 , maxNSubjects = 5 , 
	minObsPerSubject = 4 , maxObsPerSubject = 5  , 
    timePoints =  timePointsChoice , constraints =  constraintsExample ,  
	maxRepetitionIndSchemes = 1 , maxNumberOfSchemesBeforeChecks = 10^8  )  
slotNames( setOfSchemes ) 

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
timePointsEx    <-  getTimePoints( setOfSchemes )
pkData          <-  getPkData( pkModel, timePoints = timePointsEx ,
  nSubjectsPerScheme = 5 , nSamples = settings$nSamples )
plotObject( pkData , nCurves = 7 , addZeroIsZero = TRUE )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
exampleObjective      <-   data.frame( 
  criterion = c( "auc" , "cMax" , "tMax" )  ,
  weight = c( 9 , 1, 1 ) ) 
knitr::kable( exampleObjective )

## ---- echo = TRUE, message = FALSE, results = TRUE-----------------------
setOfSchemesRanked    <-  rankObject(setOfSchemes , pkData = pkData ,
  objective = exampleObjective , varianceMeasure = "var" , scaleWith  = "max" )
schemeRanking         <-  getRanking( setOfSchemesRanked )
knitr::kable( head(  schemeRanking ) )
knitr::kable( tail( schemeRanking ) )

indTopSchemes        <-  getTopNRanking( schemeRanking , nSelect = 1 )
indBottomSchemes     <-  getTopNRanking( schemeRanking , nSelect = 1 , top = FALSE )
bestScheme           <-  setOfSchemesRanked[ , , indTopSchemes ]
knitr::kable( bestScheme )
worstScheme          <-  setOfSchemesRanked[ , , indBottomSchemes ]
knitr::kable( worstScheme ) 

## ---- echo = TRUE, message = FALSE, eval = FALSE-------------------------
#  setOfSchemesRanked            <-  rankObject(setOfSchemes , pkData = pkData ,
#  objective = exampleObjective , 		varianceMeasure = "var" , scaleWith  = "max" ,
#   nCores = 2 )

## ---- echo = TRUE, message = FALSE, eval  = FALSE------------------------
#  ?rankObjectWithRange

