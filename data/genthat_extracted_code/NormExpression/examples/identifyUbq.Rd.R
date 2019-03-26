library(NormExpression)


### Name: identifyUbq
### Title: identifyUbq
### Aliases: identifyUbq
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, pre_ratio = 0.5, lower_trim = 0.05, upper_trim = 0.65,
    min_ubq = 100)
{
    qlower <- apply(data, 2, function(x) quantile(x[x != 0],
        p = lower_trim))
    qupper <- apply(data, 2, function(x) quantile(x[x != 0],
        p = upper_trim))
    ubq_genes <- NULL
    for (i in 1:nrow(data)) {
        genes_finded <- findGenes(data[i, ], qlower = qlower,
            qupper = qupper, pre_ratio = pre_ratio)
        ubq_genes <- c(ubq_genes, genes_finded)
    }
    if (length(ubq_genes) < min_ubq) {
        cat("Parameters range", lower_trim, "-", upper_trim,
            "...identified too few ubiquitous genes (", length(ubq_genes),
            "), trying range 5-95  instead", "\n")
        ubq_genes <- identifyUbqRepeat(data, pre_ratioC = pre_ratio,
            lower_trimC = 0.05, upper_trimC = 0.95)
    }
    return(ubq_genes)
  }



