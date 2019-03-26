library(NormExpression)


### Name: getFactors
### Title: getFactors
### Aliases: getFactors
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, method = c("sizefactor", "DESeq", "RLE", "UQ",
    "TMM", "TU"), lib.size = NULL, pre_ratio = 0.5, lower_trim = 0.05,
    upper_trim = 0.65, min_ubq = 100)
{
    if (!is.matrix(data))
        data <- as.matrix(data)
    if (any(is.na(data)))
        stop("NA counts not permitted")
    if (is.null(lib.size))
        libsize <- colSums(data)
    else libsize <- lib.size
    if (any(is.na(libsize)))
        stop("NA libsizes not permitted")
    method <- match.arg(method)
    i <- apply(data <= 0, 1, all)
    if (any(i))
        data <- data[!i, , drop = FALSE]
    f <- switch(method, sizefactor = 1e+06/libsize, DESeq = 1/estimateSizeFactorsForMatrix(data,
        p = 0.5), RLE = calcFactorRLE(data, p = 0.5)/libsize,
        UQ = calcFactorUpperquartile(data, lib.size = libsize,
            p = 0.75), TMM = {
            fq <- calcFactorUpperquartile(data = data, lib.size = libsize,
                p = 0.75)
            refColumn <- which.min(abs(fq - mean(fq)))
            if (length(refColumn) == 0 | refColumn < 1 | refColumn >
                ncol(data)) refColumn <- 1
            f <- rep(NA, ncol(data))
            for (i in 1:ncol(data)) {
                f[i] <- calcFactorWeighted(obs = data[, i], ref = data[,
                  refColumn], libsize.obs = libsize[i], libsize.ref = libsize[refColumn],
                  logratioTrim = 0.3, sumTrim = 0.05, doWeighting = TRUE,
                  Acutoff = -1e+10)
            }
            f
        }, TU = {
            if (!is.data.frame(data)) data <- data.frame(data)
            ubq_genes <- identifyUbq(data, lower_trim = lower_trim,
                upper_trim = upper_trim, pre_ratio = pre_ratio,
                min_ubq = min_ubq)
            ubq_sums <- colSums(data[ubq_genes, ])
            mean(ubq_sums)/ubq_sums
        }, )
    if (method == "RLE" || method == "UQ" || method == "TMM") {
        f <- 1e+06/libsize/f
    }
    norm.factors <- f/exp(mean(base::log(f)))
    round(norm.factors, digits = 5)
  }



