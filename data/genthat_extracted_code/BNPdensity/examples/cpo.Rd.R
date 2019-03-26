library(BNPdensity)


### Name: cpo
### Title: Conditional predictive ordinate function
### Aliases: cpo
### Keywords: internal

### ** Examples

## The function is currently defined as
function (obj) 
{
    fx <- obj$fx
    cpo <- 1/apply(1/fx, 1, mean)
    return(cpo)
  }



