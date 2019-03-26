library(NormExpression)


### Name: gridAUCVC
### Title: gridAUCVC
### Aliases: gridAUCVC
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, dataType = c("bk", "sc"), HG7 = NULL, ERCC = NULL,
    TN = NULL, TC = NULL, CR = NULL, NR = NULL, DESeq = NULL,
    UQ = NULL, TMM = NULL, TU = 0, GAPDH = NULL, nonzeroRatios = c(0.7,
        0.8, 0.9, 1), cvNorm = TRUE, cvResolution = 0.005)
{
    grid_result <- NULL
    if (length(TU) == 1 && TU == 1) {
        colnames_paraMatrix <- c("nonzeroRatio", "pre_ratio",
            "lower_trim", "upper_trim")
        write.table(t(as.matrix(colnames_paraMatrix)), file = "bestPara.txt",
            sep = "\t", row.names = FALSE, col.names = FALSE)
    }
    for (i in nonzeroRatios) {
        if (dataType == "sc") {
            if ((ncol(data) * i) <= 100) {
                cat("nonzeroRatio:", i, " is too small!\n")
                stop("We suggest that the minimal counts of
                nonzero samples should be greater than 100!")
            }
        }
        result <- nonzeroRatio2AUCVC(data = data, dataType = dataType,
            HG7 = HG7, ERCC = ERCC, TN = TN, TC = TC, CR = CR,
            NR = NR, DESeq = DESeq, UQ = UQ, TMM = TMM, TU = TU,
            GAPDH = GAPDH, nonzeroRatio = i, cvNorm = cvNorm,
            cvResolution = cvResolution)
        nonzeroM <- matrix(i, 1, 1, TRUE)
        colnames(nonzeroM) <- "NonzeroRatio"
        grid_record <- cbind(nonzeroM, result)
        grid_result <- rbind(grid_result, grid_record)
    }
    return(grid_result)
  }



