library(BNPdensity)


### Name: rt_
### Title: Random number generator non-standard Student-t
### Aliases: rt_
### Keywords: internal

### ** Examples

## The function is currently defined as
function (n, df, mean, sd) 
{
    mean + sd * rt(n, df, ncp = 0)
  }



