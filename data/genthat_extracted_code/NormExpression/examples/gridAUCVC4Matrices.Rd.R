library(NormExpression)


### Name: gridAUCVC4Matrices
### Title: gridAUCVC4Matrices
### Aliases: gridAUCVC4Matrices
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (..., nonzeroRatios = NULL, cvNorm = TRUE, cvResolution = 0.005)
{
    if (is.null(nonzeroRatios)) {
        stop("Please provide nonzeroRatios!")
    }
    matrices <- list(...)
    numMethod <- length(matrices)
    grid_result <- NULL
    for (i in nonzeroRatios) {
        result.sorted <- getAUCVCs(..., nonzeroRatio = i, cvNorm = cvNorm,
            cvResolution = cvResolution)
        grid_record <- c(i, result.sorted)
        names(grid_record)[1] <- "NonzeroRatio"
        grid_result <- c(grid_result, names(grid_record), grid_record)
    }
    grid_result2 <- matrix(grid_result, ncol = numMethod + 1,
        byrow = TRUE)
    return(grid_result2)
  }



