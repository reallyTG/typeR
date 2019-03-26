library(ALSM)


### Name: normal.cor.test
### Title: normal correation test
### Aliases: normal.cor.test

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (residuals, MSE)
{
    w <- 1:length(residuals)
    r <- cor(sort(residuals), sqrt(MSE) * (qnorm((w - 0.375)/(length(residuals) +
        0.25))))
    return(r)
  }



