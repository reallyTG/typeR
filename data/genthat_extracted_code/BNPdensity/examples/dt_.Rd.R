library(BNPdensity)


### Name: dt_
### Title: Non-standard student-t densit
### Aliases: dt_
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, df, mean, sd) 
{
    dt((x - mean)/sd, df, ncp = 0)/sd
  }



