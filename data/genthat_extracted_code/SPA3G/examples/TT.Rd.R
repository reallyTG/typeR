library(SPA3G)


### Name: TT
### Title: Returns the trace of the product of two matrices
### Aliases: TT

### ** Examples



## The function is currently defined as
function (M1, M2) 
{
    nn <- nrow(M1)
    S <- c()
    for (itt in 1:nn) {
        S[itt] <- sum(M1[itt, ] * M2[, itt])
    }
    trace <- sum(S)
    return(trace)
  }



