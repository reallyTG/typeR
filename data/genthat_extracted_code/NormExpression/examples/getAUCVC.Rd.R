library(NormExpression)


### Name: getAUCVC
### Title: getAUCVC
### Aliases: getAUCVC
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, nonzeroRatio = NULL, cvNorm = TRUE, cvResolution = 0.005)
{
    nozeroIndex <- filteredZero(data, nonzeroRatio = nonzeroRatio)
    dataUse2CV <- data[nozeroIndex, ]
    cv.result <- getCV(dataUse2CV, cvNorm = cvNorm)
    CV2AUCVC(cv.result, cvResolution = cvResolution)
  }



