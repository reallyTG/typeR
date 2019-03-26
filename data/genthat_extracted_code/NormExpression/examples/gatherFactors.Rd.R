library(NormExpression)


### Name: gatherFactors
### Title: gatherFactors
### Aliases: gatherFactors
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, methods = c("HG7", "ERCC", "TN", "TC", "CR",
    "NR", "DESeq", "UQ", "TMM", "TU"), HG7.size = NULL, ERCC.size = NULL,
    TN.size = NULL, TC.size = NULL, CR.size = NULL, NR.size = NULL,
    pre_ratio = 0.5, lower_trim = 0.05, upper_trim = 0.65, min_ubq = 100)
{
    method1 <- as.list(methods)
    numMethod <- length(method1)
    method_range <- seq(1, numMethod, 1)
    for (i in method_range) {
        if (method1[[i]] == "HG7" || method1[[i]] == "ERCC" ||
            method1[[i]] == "TN" || method1[[i]] == "TC" || method1[[i]] ==
            "CR" || method1[[i]] == "NR") {
            size.name <- paste(method1[[i]], ".size", sep = "")
            out.name1 <- paste(method1[[i]], ".factors", sep = "")
            if (is.null(size.name)) {
                stop("Please provide", size.name, "!")
            }
            else {
                assign(out.name1, getFactors(data, method = "sizefactor",
                  lib.size = get(size.name)))
            }
        }
        if (method1[[i]] == "DESeq" || method1[[i]] == "RLE" ||
            method1[[i]] == "UQ" || method1[[i]] == "TMM") {
            out.name2 <- paste(method1[[i]], ".factors", sep = "")
            assign(out.name2, getFactors(data, method = method1[[i]]))
        }
        if (method1[[i]] == "TU") {
            TU.factors <- getFactors(data, method = "TU", pre_ratio = pre_ratio,
                lower_trim = lower_trim, upper_trim = upper_trim,
                min_ubq = min_ubq)
        }
    }
    factors.list <- NULL
    for (m in methods) {
        m.factors <- paste(m, ".factors", sep = "")
        factors.list <- c(factors.list, m.factors)
    }
    factors.result <- NULL
    for (i in method_range) {
        factors.result <- cbind(factors.result, get(factors.list[i]))
    }
    colnames(factors.result) <- methods
    return(factors.result)
  }



