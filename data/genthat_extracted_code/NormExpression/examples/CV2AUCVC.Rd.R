library(NormExpression)


### Name: CV2AUCVC
### Title: CV2AUCVC
### Aliases: CV2AUCVC
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (data, cvResolution = 0.005)
{
    cv_cutoff <- NULL
    uniform_genes_counts <- NULL
    for (i in seq(0, 1, cvResolution)) {
        cv_cutoff <- c(cv_cutoff, i)
        gene_number <- length(which(data <= i))
        uniform_genes_counts <- c(uniform_genes_counts, gene_number)
    }
    getArea(cv_cutoff, uniform_genes_counts)
  }



