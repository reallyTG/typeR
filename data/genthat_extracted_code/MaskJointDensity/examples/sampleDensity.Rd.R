library(MaskJointDensity)


### Name: sampleDensity
### Title: A function used to simulate a sample from a kernel function,
###   where the kernel function is determined by a given sample.
### Aliases: sampleDensity
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (sx, boundaryVec, NoNote = 151, size = 100) 
{
    n <- NoNote
    SXdim <- length(sx[1, ])
    vectorL <- rep(n, SXdim)
    XP <- NULL
    for (i in 1:SXdim) {
        a <- boundaryVec[2 * i - 1]
        b <- boundaryVec[2 * i]
        xposition <- seq(from = a, to = b, by = (b - a)/(n - 
            1))
        XP <- c(XP, xposition)
    }
    NotePositions <- positions(XP, vectorL)
    H <- Hpi(x = sx)
    fhat <- kde(x = sx, H = H)
    prob <- predict(fhat, x = NotePositions)
    outSample <- actualPosition(vectorL, prob, boundaryVec, size)
    return(outSample)
  }



