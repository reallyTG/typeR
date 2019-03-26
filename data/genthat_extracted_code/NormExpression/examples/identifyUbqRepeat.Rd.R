library(NormExpression)


### Name: identifyUbqRepeat
### Title: identifyUbqRepeat
### Aliases: identifyUbqRepeat
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, pre_ratioC = NULL, lower_trimC = NULL, upper_trimC = NULL)
{
    qlower <- apply(data, 2, function(x) quantile(x[x != 0],
        p = lower_trimC))
    qupper <- apply(data, 2, function(x) quantile(x[x != 0],
        p = upper_trimC))
    ubq_genes <- NULL
    for (i in 1:nrow(data)) {
        genes_finded <- findGenes(data[i, ], qlower = qlower,
            qupper = qupper, pre_ratio = pre_ratioC)
        ubq_genes <- c(ubq_genes, genes_finded)
    }
    return(ubq_genes)
  }



