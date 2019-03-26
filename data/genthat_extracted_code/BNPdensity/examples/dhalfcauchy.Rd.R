library(BNPdensity)


### Name: dhalfcauchy
### Title: Density half Cauchy
### Aliases: dhalfcauchy
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, location = 0, scale = 1) 
{
    ifelse(x < 0, 0, 1) * dcauchy(x, location, scale)/(1 - pcauchy(0, 
        location, scale))
  }



