library(NormExpression)


### Name: gatherCVs
### Title: gatherCVs
### Aliases: gatherCVs
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, nonzeroRatio = NULL, HG7 = NULL, ERCC = NULL,
    TN = NULL, TC = NULL, CR = NULL, NR = NULL, DESeq = NULL,
    UQ = NULL, TMM = NULL, TU = NULL, GAPDH = NULL, cvNorm = TRUE,
    cvResolution = 0.005)
{
    if (is.null(nonzeroRatio)) {
        stop("Please provide nonzeroRatio!")
    }
    methodsList <- list(HG7 = HG7, ERCC = ERCC, TN = TN, TC = TC,
        CR = CR, NR = NR, DESeq = DESeq, UQ = UQ, TMM = TMM,
        TU = TU, GAPDH = GAPDH)
    specifiedMethods <- methodsList[!unlist(lapply(methodsList,
        is.null))]
    numMethod <- length(specifiedMethods)
    method_range_tmp <- seq(1, numMethod, 1)
    cv_range_tmp <- seq(0, 1, cvResolution)
    method_range_times <- length(cv_range_tmp)
    cv_range_times <- length(method_range_tmp)
    method_range <- rep(method_range_tmp, each = round(method_range_times))
    cv_range <- rep(cv_range_tmp, times = round(cv_range_times))
    nozeroIndex <- filteredZero(data, nonzeroRatio = nonzeroRatio)
    for (j in method_range_tmp) {
        norm.matrix <- getNormMatrix(data, specifiedMethods[[j]])
        dataUse2CV <- norm.matrix[nozeroIndex, ]
        cv.result <- getCV(dataUse2CV, cvNorm = cvNorm)
        assign(paste(names(specifiedMethods)[j], ".cv", sep = ""),
            cv.result)
    }
    cv_uniform <- NULL
    cv_uniform_all <- mapply(function(i, j) {
        cv.result <- paste(names(specifiedMethods)[j], ".cv",
            sep = "")
        gene_number <- length(which(get(cv.result) <= i))
        cv_uniform_row <- c(i, gene_number, names(specifiedMethods)[j])
        rbind(cv_uniform, cv_uniform_row)
    }, cv_range, method_range)
    cv_uniform_all <- t(cv_uniform_all)
    colnames(cv_uniform_all) <- c("Cutoff", "Counts", "Methods")
    return(cv_uniform_all)
  }



