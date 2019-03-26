library(BNPdensity)


### Name: phalfcauchy
### Title: Distribution function half Cauchy
### Aliases: phalfcauchy
### Keywords: internal

### ** Examples

## The function is currently defined as
function (q, location = 0, scale = 1) 
{
    ifelse(x < 0, 0, 1) * (pcauchy(q, location, scale) - pcauchy(0, 
        location, scale))/(1 - pcauchy(0, location, scale))
  }



