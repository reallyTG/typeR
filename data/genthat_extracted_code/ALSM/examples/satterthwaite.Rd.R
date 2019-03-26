library(ALSM)


### Name: satterthwaite
### Title: satterthwaite
### Aliases: satterthwaite

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (c, MSE, df, alpha = 0.05)
{
    l = c * MSE
    L = sum(c * MSE)
    dff <- ((L^2)/sum((l^2)/df))
    lower <- (dff * L)/(qchisq(1 - alpha/2, round(dff)))
    upper <- (dff * L)/(qchisq(alpha/2, round(dff)))
    return(cbind(estimate = L, df = round(dff), lower = lower,
        upper = upper))
  }



