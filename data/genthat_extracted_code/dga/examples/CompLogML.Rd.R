library(dga)


### Name: CompLogML
### Title: Computes Marginal Likelihoods for Each Clique and Value of
###   Nmissing
### Aliases: CompLogML
### Keywords: capture-recapture multiple systems estimation BMA

### ** Examples



## The function is currently defined as
function (D, delta) 
{
    out <- apply(lgamma(D + delta), 1, sum) - apply(lgamma(D * 
        0 + delta), 1, sum)
    return(out)
  }



