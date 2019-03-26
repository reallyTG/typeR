library(formula.tools)


### Name: as.character.formula
### Title: Converts a formula to character
### Aliases: as.character.formula as.character
### Keywords: manip utilities

### ** Examples


  as.character( y ~ mx +  b )

## The function is currently defined as
function(x)
  Reduce( paste, deparse(x) )
  



