library(smdc)


### Name: simSyn
### Title: Synthesis of Document Similarity
### Aliases: simSyn
### Keywords: ~kwd1 ~kwd2

### ** Examples


## The function is currently defined as
function (sims, weight) 
{
    len = length(sims)
    if (len != length(weight)) {
        stop(message = "different lengths between sims and weight")
    }
    sim <- weight[1] * sims[[1]]
    for (i in 2:len) {
        sim <- sim + weight[i] * sims[[i]]
    }
    return(sim)
  }



