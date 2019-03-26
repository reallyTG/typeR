library(hierfstat)


### Name: fstat
### Title: Wrapper for fst estimator from hierfstat package (from adegenet)
### Aliases: FST fst fstat pairwise.fst
### Keywords: multivariate

### ** Examples

## Not run: 
##D if(require(adegenet)){
##D data(nancycats)
##D 
##D ## pairwise Fst
##D mat.fst <- pairwise.fst(nancycats, res.type="matrix")
##D mat.fst
##D }
##D 
##D ## Fst, Fis, Fit
##D ## using hierfstat
##D if(require(hierfstat)){
##D fstat(nancycats)
##D }
##D 
##D ## using pegas
##D if(require(pegas)){
##D data(nancycats)
##D 
##D ## conversion to pegas's format
##D as.loci(nancycats)
##D 
##D ## use Fst from pegas
##D fsttab <- Fst(as.loci(nancycats))
##D 
##D ## average over loci
##D apply(fsttab, 2, mean)
##D }
## End(Not run)



