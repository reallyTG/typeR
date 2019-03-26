library(BNPdensity)


### Name: qt_
### Title: Quantile function non-standard Student-t
### Aliases: qt_
### Keywords: internal

### ** Examples

## The function is currently defined as
function (p, df, mean, sd) 
{
    sd * qt(p, df, ncp = 0) + mean
  }



