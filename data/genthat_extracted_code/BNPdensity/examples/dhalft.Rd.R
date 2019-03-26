library(BNPdensity)


### Name: dhalft
### Title: Density half Student-t
### Aliases: dhalft
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, df = 1, mean = 0, sd = 1) 
{
    ifelse(x < 0, 0, 1) * dt_(x, df, mean, sd)/(1 - pt_(0, df, 
        mean, sd))
  }



