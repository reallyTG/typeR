library(NormExpression)


### Name: gatherCVs4Matrices
### Title: gatherCVs4Matrices
### Aliases: gatherCVs4Matrices
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (..., raw_matrix, nonzeroRatio = NULL, cvNorm = TRUE,
    cvResolution = 0.005)
{
    if (is.null(nonzeroRatio)) {
        stop("Please provide nonzeroRatio!")
    }
    matrices <- list(...)
    matrices_name <- names(matrices)
    numMethod <- length(matrices)
    method_range_tmp <- seq(1, numMethod, 1)
    cv_range_tmp <- seq(0, 1, cvResolution)
    method_range_times <- length(cv_range_tmp)
    cv_range_times <- length(method_range_tmp)
    method_range <- rep(method_range_tmp, each = round(method_range_times))
    cv_range <- rep(cv_range_tmp, times = round(cv_range_times))
    nozeroIndex <- filteredZero(raw_matrix, nonzeroRatio = nonzeroRatio)
    for (j in method_range_tmp) {
        dataUse2CV <- matrices[[j]][nozeroIndex, ]
        cv.result <- getCV(dataUse2CV, cvNorm = cvNorm)
        assign(paste(matrices_name[j], ".cv", sep = ""), cv.result)
    }
    cv_uniform <- NULL
    cv_uniform_all <- mapply(function(i, j) {
        cv.result <- paste(matrices_name[j], ".cv", sep = "")
        gene_number <- length(which(get(cv.result) <= i))
        cv_uniform_row <- c(i, gene_number, matrices_name[j])
        rbind(cv_uniform, cv_uniform_row)
    }, cv_range, method_range)
    cv_uniform_all <- t(cv_uniform_all)
    colnames(cv_uniform_all) <- c("Cutoff", "Counts", "Methods")
    return(cv_uniform_all)
  }



