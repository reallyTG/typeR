library(microsamplingDesign)


### Name: plotObject
### Title: generic function to plot an object
### Aliases: plotObject plotObject,PkModel-method plotObject,PkData-method

### ** Examples

## Not run: 
##D # examples with limited number of samples, increase samples in practice
##D plotObject( object =  getExamplePkModel() , 
##D    times = seq( 0 , 10 , 1 )  , nSamplesIntegration = 25 )
##D plotObject( object =  getExamplePkModel() ,
##D    times = seq( 0 , 10 , 1 ) , nCurves = 3 , nSamplesIntegration = 5  )
##D plotObject( object =  getExamplePkModel() ,
##D     times = seq( 0 , 10 , 1 ) , nCurves = 3 , sampleCurvesOnly = TRUE  )
## End(Not run)
## Not run: 
##D pkData    <-   getPkData( getExamplePkModel() , 1:10 ,  5 , 10 )
##D plotObject( object =  pkData  )
##D plotObject( object =  pkData , nCurves = 2 )
##D plotObject( object =  pkData , nCurves = 2 , addZeroIsZero = TRUE )
##D plotObject( object = pkData , nCurves = 3 , 
##D    sampleCurvesOnly = FALSE , nSamplesIntegration = 25   ) 
## End(Not run) 



