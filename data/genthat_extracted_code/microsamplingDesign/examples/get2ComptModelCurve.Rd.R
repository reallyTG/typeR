library(microsamplingDesign)


### Name: get2ComptModelCurve
### Title: provides solution of two compartmental pharmacodynamic model at
###   specified time points
### Aliases: get2ComptModelCurve

### ** Examples

  pkModel               <-  getExamplePkModel()
  parameters            <-  getParameters( pkModel )
  testParameters        <-  parameters[ , "value"] 
  names(testParameters)  <-  parameters[ , "parameter"]
  time                  <-  seq( 0 , 3 , 0.1 )
  dosingInfo            <-  data.frame( time = c( 0 , 1 , 2) , 
       dose = c( 5 , 2 , 1.5 ) )
  get2ComptModelCurve( parameters = testParameters , time , dosingInfo )
  get2ComptModelCurve( parameters = testParameters, time ,
    dosingInfo , returnAll = TRUE )  



