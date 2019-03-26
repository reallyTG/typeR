library(NormExpression)


### Name: findGenes
### Title: findGenes
### Aliases: findGenes
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (g, qlower = NULL, qupper = NULL, pre_ratio = NULL)
{
    gene_name <- rownames(g)
    g <- unlist(g)
    seen <- which(g >= qlower & g <= qupper)
    counts <- length(seen)
    if (counts >= pre_ratio * length(g)) {
        gene_name
    }
  }



