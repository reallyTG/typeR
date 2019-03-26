library(BNPdensity)


### Name: qhalft
### Title: Quantile function half Student-t
### Aliases: qhalft
### Keywords: internal

### ** Examples

## The function is currently defined as
function (p, df = 1, mean = 0, sd = 1) 
{
    qt_(p * (1 - pt_(0, df, mean, sd)) + pt_(0, df, mean, sd), 
        df, mean, sd)
  }



