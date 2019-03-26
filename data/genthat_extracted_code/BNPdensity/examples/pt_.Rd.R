library(BNPdensity)


### Name: pt_
### Title: Distribution function non-standard student-t
### Aliases: pt_
### Keywords: internal

### ** Examples

## The function is currently defined as
function (x, df, mean, sd) 
{
    pt((x - mean)/sd, df, ncp = 0)
  }



