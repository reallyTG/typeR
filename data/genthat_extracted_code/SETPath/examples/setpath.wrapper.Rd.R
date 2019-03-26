library(SETPath)


### Name: setpath.wrapper
### Title: Runs the Spiked Eigenvalue Test for Pathway data (SETPath) on
###   multiple pathways in a dataset
### Aliases: setpath.wrapper
### Keywords: ~kwd1 ~kwd2

### ** Examples

# use the function setpath.wrapper to analyze several pathways simultaneously
data(setpath.data)
setpath.wrapper(d1,d2,pathwaygenes,pathwaynames,M=1,transform=NULL,minalpha=NULL,normalize=TRUE,
	pvalue="chisq",npermutations=10000)

## The function is currently defined as
function (d1, d2, pathwaygenes, pathwaynames, M = 1, transform = NULL, 
    minalpha = NULL, normalize = TRUE, pvalue = "chisq", npermutations = 10000) 
{
    K = length(pathwaynames)
    results = matrix(NA, K, 2 * (M + 1) + 2)
    dimnames(results)[[1]] = pathwaynames
    dimnames(results)[[2]] = c("n.genes", paste("alpha.0", 1:M, 
        sep = "."), "T.0", paste("alpha.0", 1:M, sep = "."), 
        "T.0", "pval")
    if (!identical(dimnames(d1)[[2]], dimnames(d2)[[2]])) {
        stop("d1 and d2 have different feature (column) names.")
    }
    for (k in 1:K) {
        missinggenes = setdiff(pathwaygenes[[k]], dimnames(d1)[[2]])
        if (length(missinggenes) > 0) {
            warning(c("The following pathway genes are missing from the dataset:", 
                missinggenes))
            pathwaygenes[[k]] = intersect(pathwaygenes[[k]], 
                dimnames(d1)[[2]])
        }
        temp = setpath(d1[, pathwaygenes[[k]]], d2[, pathwaygenes[[k]]], 
            M = M, transform = transform, verbose = TRUE, minalpha = minalpha, 
            normalize = normalize, pvalue = pvalue, npermutations = npermutations)
        results[k, ] = c(length(pathwaygenes[[k]]), temp$stats[, 
            1], temp$stats[, 2], temp$pval)
    }
    return(results)
  }



