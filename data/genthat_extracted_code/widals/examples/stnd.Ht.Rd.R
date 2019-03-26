library(widals)


### Name: stnd.Ht
### Title: Standardize Temporal Covariates
### Aliases: stnd.Ht
### Keywords: ~kwd1 ~kwd2

### ** Examples


##### Please see the examples in Hst.sumup


## The function is currently defined as
function (Ht, n) 
{
    h.mean <- apply(Ht, 2, mean)
    sHt <- t(t(Ht) - h.mean)
    sHt <- t(t(sHt)/apply(sHt, 2, function(x) {
        sqrt(sum(x^2))
    }))
    sHt <- sHt * sqrt(nrow(Ht)/n)
    return(sHt)
  }



