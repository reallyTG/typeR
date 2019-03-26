library(microsamplingDesign)


### Name: subsetOnTimePoints
### Title: generic function to subset the 'timePoints'-slot and generate an
###   object of the same class
### Aliases: subsetOnTimePoints subsetOnTimePoints,PkModel-method

### ** Examples

## Don't show: 
 pkData  <- getExampleData() 
## End(Don't show)
subsetOnTimePoints( pkData, c( 1 , 2 ) )
subsetOnTimePoints( object = pkData, timePointsSelect =  c( 1 , 2 ) )



