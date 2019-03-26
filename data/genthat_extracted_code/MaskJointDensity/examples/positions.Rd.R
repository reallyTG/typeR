library(MaskJointDensity)


### Name: positions
### Title: Function for finding the positions of the node representing the
###   points at which to sample from the kernel density estimate.
### Aliases: positions
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (x, vectorL) 
{
    backwardNumber <- 1
    forwardNumber <- 1
    for (i in 1:length(vectorL)) {
        backwardNumber <- backwardNumber * vectorL[i]
    }
    backwardNumber <- backwardNumber/vectorL[1]
    y1 <- rep(x[1:vectorL[1]], each = backwardNumber)
    y <- y1
    forwardNumber <- forwardNumber * vectorL[1]
    if (length(vectorL) - 2 <= 0) {
        y1 <- rep(x[vectorL[length(vectorL) - 1] + 1:vectorL[length(vectorL)]], 
            forwardNumber)
        y <- cbind(y, y1)
    }
    else {
        a1 <- 0
        b1 <- 0
        for (i in 1:(length(vectorL) - 2)) {
            backwardNumber <- backwardNumber/vectorL[i + 1]
            a1 <- a1 + vectorL[i]
            b1 <- a1 + vectorL[i + 1]
            a <- a1 + 1
            b <- b1
            y1 <- rep(x[a:b], each = backwardNumber)
            y1 <- rep(y1, forwardNumber)
            forwardNumber <- forwardNumber * vectorL[i + 1]
            y <- cbind(y, y1)
        }
        a1 <- a1 + vectorL[length(vectorL) - 1]
        b1 <- a1 + vectorL[length(vectorL)]
        a <- a1 + 1
        b <- b1
        y1 <- rep(x[a:b], forwardNumber)
        y <- cbind(y, y1)
    }
    return(y)
  }



