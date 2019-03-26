library(NormExpression)


### Name: gatherCors4Matrices
### Title: gatherCors4Matrices
### Aliases: gatherCors4Matrices
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (..., raw_matrix, cor_method = c("spearman", "pearson",
    "kendall"), pre_ratio = 0.5, lower_trim = 0.05, upper_trim = 0.65,
    rounds = 1e+06)
{
    matrices <- list(...)
    numMethod <- length(matrices)
    method_range <- seq(1, numMethod, 1)
    ubq_genes <- identifyUbq(raw_matrix, pre_ratio = pre_ratio,
        lower_trim = lower_trim, upper_trim = upper_trim, min_ubq = 100)
    cor_value_method <- NULL
    for (j in method_range) {
        dataUse2Cor <- matrices[[j]][ubq_genes, ]
        cor.result <- getCor(dataUse2Cor, method = cor_method,
            rounds = rounds)
        cor_vm <- cbind(cor.result, rep(names(matrices)[j], times = round(rounds)))
        cor_value_method <- rbind(cor_value_method, cor_vm)
    }
    colnames(cor_value_method) <- c("Value", "Methods")
    return(cor_value_method)
  }



