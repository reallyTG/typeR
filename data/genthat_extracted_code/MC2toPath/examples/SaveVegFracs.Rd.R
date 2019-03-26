library(MC2toPath)


### Name: SaveVegFracs
### Title: Save the yearly series of veg type fractions
### Aliases: SaveVegFracs
### Keywords: IO file

### ** Examples

## The function is currently defined as
function (vegChanges, outFile) 
{
    startYear = vegChanges[[2]][1]
    SaveMatrix(startYear, vegChanges[[4]], outFile)
    return(TRUE)
  }



