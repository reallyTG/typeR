library(adegenet)


### Name: HWE.test.genind
### Title: Hardy-Weinberg Equilibrium test for multilocus data
### Aliases: HWE.test.genind
### Keywords: manip multivariate

### ** Examples

## Not run: 
##D data(nancycats)
##D obj <- nancycats
##D if(require(genetics)){
##D obj.test <- HWE.test(obj)
##D 
##D # pvalues matrix to have a preview
##D HWE.test(obj,res.type="matrix")
##D 
##D #more precise view to...
##D obj.test$fca90$P10
##D }
## End(Not run)



