library(BNPdensity)


### Name: dhalfnorm
### Title: Density half normal
### Aliases: dhalfnorm
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, mean = 0, sd = 1) 
{
    ifelse(x < 0, 0, 1) * dnorm(x, mean, sd)/(1 - pnorm(0, mean, 
        sd))
  }



