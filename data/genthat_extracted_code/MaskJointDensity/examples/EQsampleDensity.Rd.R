library(MaskJointDensity)


### Name: EQsampleDensity
### Title: Samples from a bunch of nodes on a grid.
### Aliases: EQsampleDensity
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (sx, boundaryVec, NoNote = 215, size = 100) 
{
    n <- NoNote
    SXdim <- length(sx[1, ])
    space <- NULL
    for (i in 1:SXdim) {
        a <- boundaryVec[2 * i - 1]
        b <- boundaryVec[2 * i]
        d <- (b - a)/(n - 1)
        space <- c(space, d)
    }
    d <- min(space)
    XP <- NULL
    vectorL <- NULL
    for (i in 1:SXdim) {
        a <- boundaryVec[2 * i - 1]
        b <- boundaryVec[2 * i]
        xposition <- seq(from = a, to = b, by = d)
        L <- length(xposition)
        XP <- c(XP, xposition)
        vectorL <- c(vectorL, L)
    }
    NotePositions <- positions(XP, vectorL)
    H <- Hpi(x = sx)
    fhat <- kde(x = sx, H = H)
    prob <- predict(fhat, x = NotePositions)
    outSample <- actualPosition(vectorL, prob, boundaryVec, size)
    return(outSample)
  }



