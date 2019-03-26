library(NormExpression)


### Name: optTU
### Title: optTU
### Aliases: optTU
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, nonzeroRatio = NULL, pre_ratio_range = c(0.2,
    0.6), prResolution = 0.1, lower_range = c(0.05, 0.4), upper_range = c(0.6,
    0.95), qResolution = 0.05, min_ubq = 100, cvNorm = TRUE,
    cvResolution = 0.005)
{
    if (is.null(nonzeroRatio)) {
        stop("Please provide nonzeroRatios!")
    }
    pre_ratio_times <- (pre_ratio_range[2] - pre_ratio_range[1] +
        prResolution) * 10
    lower_times <- (upper_range[2] - upper_range[1] + qResolution)/qResolution
    lower_range_tmp <- rep(seq(lower_range[1], lower_range[2],
        qResolution), each = round(lower_times))
    lower_range2 <- rep(lower_range_tmp, times = round(pre_ratio_times))
    upper_times <- (lower_range[2] - lower_range[1] + qResolution)/qResolution
    upper_range_tmp <- rep(seq(upper_range[1], upper_range[2],
        qResolution), times = round(upper_times))
    upper_range2 <- rep(upper_range_tmp, times = round(pre_ratio_times))
    lower_upper_tmp_len <- length(lower_range_tmp)
    pre_ratio_range2 <- rep(seq(pre_ratio_range[1], pre_ratio_range[2],
        0.1), each = round(lower_upper_tmp_len))
    nozeroIndex <- filteredZero(data, nonzeroRatio = nonzeroRatio)
    all_aucvc <- mapply(function(lower_trim, upper_trim, pre_ratio) {
        factors.TU <- getFactors(data, method = "TU", lower_trim = lower_trim,
            upper_trim = upper_trim, pre_ratio = pre_ratio, min_ubq = min_ubq)
        norm.TU <- getNormMatrix(data, factors.TU)
        dataUse2CV <- norm.TU[nozeroIndex, ]
        cv.TU <- getCV(dataUse2CV, cvNorm = cvNorm)
        TU.AUCVC <- CV2AUCVC(cv.TU, cvResolution = cvResolution)
        return(c(TU.AUCVC = TU.AUCVC, lower = lower_trim, upper = upper_trim,
            ratio = pre_ratio))
    }, lower_range2, upper_range2, pre_ratio_range2)
    all_aucvc2 <- t(all_aucvc)
    max_index <- which(max(all_aucvc2[, "TU.AUCVC"]) == all_aucvc2[,
        "TU.AUCVC"])
    return(all_aucvc2[max_index, ])
  }



