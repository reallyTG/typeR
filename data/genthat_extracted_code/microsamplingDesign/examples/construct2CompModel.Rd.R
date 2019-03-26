library(microsamplingDesign)


### Name: construct2CompModel
### Title: construct a 2 compartmental 'PkModel-class' by providing
###   parameters and dosing info
### Aliases: construct2CompModel

### ** Examples

  dosingInfo              <-  data.frame( time = 0 , dose = 1 )
  dataParametersFile      <-  system.file(  "extData",
 "examplePkParameters.csv" ,   package = "microsamplingDesign" )
  exampleParameters       <-  read.csv( dataParametersFile ,
 stringsAsFactors = FALSE , na.strings = NULL )
  pkModel                 <-  construct2CompModel( exampleParameters , dosingInfo ) 
  plotObject( pkModel , times = seq( 0, 5 , 0.1) , nSamplesIntegration = 12 )



