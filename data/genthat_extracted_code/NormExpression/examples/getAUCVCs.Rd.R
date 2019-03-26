library(NormExpression)


### Name: getAUCVCs
### Title: getAUCVCs
### Aliases: getAUCVCs
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (..., nonzeroRatio = NULL, cvNorm = TRUE, cvResolution = 0.005)
{
    matrices <- list(...)
    numMethod <- length(matrices)
    method_range <- seq(1, numMethod, 1)
    result <- NULL
    for (i in method_range) {
        AUCVC.result <- getAUCVC(matrices[[i]], nonzeroRatio = nonzeroRatio,
            cvNorm = cvNorm, cvResolution = cvResolution)
        result <- c(result, AUCVC.result)
        names(result)[i] <- names(matrices)[i]
    }
    sorted_AUCVCs <- sort(result, decreasing = TRUE)
    return(sorted_AUCVCs)
  }



