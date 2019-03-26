library(micEcon)


### Name: logDataSet
### Title: Creating a Data Set with the Logarithms of the Original
###   Variables
### Aliases: logDataSet
### Keywords: array

### ** Examples

   data( "germanFarms" )
   datLog <- logDataSet( germanFarms, c( "vAnimal", "vOutput", "vVarInput" ) )
   summary( datLog )



