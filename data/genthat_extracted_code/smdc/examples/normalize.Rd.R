library(smdc)


### Name: normalize
### Title: Normalization of Similarity Matrix
### Aliases: normalize
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (sim) 
{
    meanVec <- apply(sim, 1, mean, na.rm = TRUE)
    sdVec <- apply(sim, 1, sd, na.rm = TRUE)
    sim <- t(scale(t(sim), meanVec, sdVec))
    return(sim)
  }



