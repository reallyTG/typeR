library(BNPdensity)


### Name: qhalfnorm
### Title: Quantile function half Normal
### Aliases: qhalfnorm
### Keywords: internal

### ** Examples

## The function is currently defined as
function (p, mean = 0, sd = 1) 
{
    qnorm(p * (1 - pnorm(0, mean, sd)) + pnorm(0, mean, sd), 
        mean, sd)
  }



