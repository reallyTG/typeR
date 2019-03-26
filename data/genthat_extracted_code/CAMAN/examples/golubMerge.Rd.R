library(CAMAN)


### Name: golubMerge
### Title: Data from the Golub et al (1999) Paper
### Aliases: golubMerge golubMerge.exprs sample.labels
### Keywords: datasets

### ** Examples

## Not run: 
##D ## microarray analysis example
##D data(golubMerge)
##D idxALL <- which(sample.labels== "ALL")
##D idxAML <- which(sample.labels == "AML")
##D pvals <- apply(golubMerge.exprs, 1, function(x){t.test(x[idxAML],x[idxALL])[[3]]})
##D zvals <- qnorm(1-pvals)
##D hist(zvals,100)
##D ### Z-values are gaussian distributed, mix identifies a mixture of gaussians. 
##D mix <- mixalg(obs=zvals, family="gaussian", startk=25)
##D hist(mix)
##D 
##D ### get False discovery rate (Not-differential expressed genes are in component 1)
##D getFDR(mix, threshold=.4)
## End(Not run)



