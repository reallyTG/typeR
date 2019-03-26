library(MaskJointDensity)


### Name: barredToActual
### Title: Purely used in actualPosition
### Aliases: barredToActual
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (vectorL, boundaryVec, barred) 
{
    size <- nrow(barred)
    dim <- ncol(barred)
    actual <- matrix(nrow = size, ncol = dim)
    for (i in 1:size) {
        for (j in 1:dim) {
            actual[i, j] <- boundaryVec[2 * j - 1] + (boundaryVec[2 * 
                j] - boundaryVec[2 * j - 1])/(vectorL[j] - 1) * 
                (barred[i, j] - 1)
        }
    }
    return(actual)
  }



