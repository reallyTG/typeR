library(NormExpression)


### Name: nonzeroRatio2AUCVC
### Title: nonzeroRatio2AUCVC
### Aliases: nonzeroRatio2AUCVC
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, dataType = c("bk", "sc"), HG7 = NULL, ERCC = NULL,
    TN = NULL, TC = NULL, CR = NULL, NR = NULL, DESeq = NULL,
    UQ = NULL, TMM = NULL, TU = 0, GAPDH = NULL, nonzeroRatio = NULL,
    cvNorm = TRUE, cvResolution = 0.005)
{
    nozeroIndex <- filteredZero(data, nonzeroRatio = nonzeroRatio)
    methodsList <- list(HG7 = HG7, ERCC = ERCC, TN = TN, TC = TC,
        CR = CR, NR = NR, DESeq = DESeq, UQ = UQ, TMM = TMM,
        TU = TU, GAPDH = GAPDH)
    specifiedMethods <- methodsList[!unlist(lapply(methodsList,
        is.null))]
    if (length(TU) == 1 && TU == 0) {
        specifiedMethods$TU <- NULL
    }
    if (length(TU) == 1 && TU == 1) {
        if (dataType == "bk") {
            optimalPara <- optTU(data, nonzeroRatio = nonzeroRatio,
                pre_ratio_range = c(1, 1), prResolution = 0.1,
                lower_range = c(0.05, 0.4), upper_range = c(0.6,
                  0.95), qResolution = 0.05, min_ubq = 1000,
                cvNorm = cvNorm, cvResolution = cvResolution)
        }
        else {
            optimalPara <- optTU(data, nonzeroRatio = nonzeroRatio,
                pre_ratio_range = c(0.2, 0.6), prResolution = 0.1,
                lower_range = c(0.05, 0.4), upper_range = c(0.6,
                  0.95), qResolution = 0.05, min_ubq = 100, cvNorm = cvNorm,
                cvResolution = cvResolution)
        }
        optimalPara <- as.matrix(optimalPara)
        lower_trim <- optimalPara["lower", 1]
        upper_trim <- optimalPara["upper", 1]
        pre_ratio <- optimalPara["ratio", 1]
        para <- c(nonzeroRatio, pre_ratio, lower_trim, upper_trim)
        names(para)[1] <- "nonzeroRatio"
        paraMatrix <- t(as.matrix(para))
        write.table(paraMatrix, file = "bestPara.txt", sep = "\t",
            row.names = FALSE, col.names = FALSE, append = TRUE)
        TU.factors <- getFactors(data, method = "TU", lower_trim = lower_trim,
            upper_trim = upper_trim, pre_ratio = pre_ratio, min_ubq = 100)
        norm.matrix <- getNormMatrix(data, TU.factors)
        dataUse2CV <- norm.matrix[nozeroIndex, ]
        cv.result <- getCV(dataUse2CV, cvNorm = cvNorm)
        TU.AUCVC <- CV2AUCVC(cv.result, cvResolution = cvResolution)
        specifiedMethods$TU <- NULL
    }
    numMethod <- length(specifiedMethods)
    if (numMethod >= 1) {
        method_range <- seq(1, numMethod, 1)
        for (i in method_range) {
            norm.matrix <- getNormMatrix(data, specifiedMethods[[i]])
            dataUse2CV <- norm.matrix[nozeroIndex, ]
            cv.result <- getCV(dataUse2CV, cvNorm = cvNorm)
            assign(names(specifiedMethods)[i], CV2AUCVC(cv.result,
                cvResolution = cvResolution))
        }
        AUCVC.result <- NULL
        for (i in method_range) {
            AUCVC.result <- cbind(AUCVC.result, get(names(specifiedMethods)[i]))
        }
        colnames(AUCVC.result) <- names(specifiedMethods)
        if (length(TU) == 1 && TU == 1) {
            AUCVC.result <- cbind(AUCVC.result, TU.AUCVC)
            colnames(AUCVC.result) <- c(names(specifiedMethods),
                "TU")
        }
    }
    if (numMethod == 0 && TU == 0)
        stop("Please specify at least one method!")
    if (numMethod == 0 && TU == 1) {
        AUCVC.result <- as.matrix(TU.AUCVC)
        colnames(AUCVC.result) <- "TU"
    }
    return(AUCVC.result)
  }



