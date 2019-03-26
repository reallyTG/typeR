library(pegas)


### Name: hw.test
### Title: Test of Hardy-Weinberg Equilibrium
### Aliases: hw.test hw.test.loci hw.test.genind
### Keywords: htest

### ** Examples

## Not run: 
##D require(adegenet)
##D 
##D ## load data
##D data(nancycats)
##D 
##D ## test on genind object, no permutation
##D hw.test(nancycats, B=0)
##D 
##D ## test on loci object
##D x <- as.loci(nancycats)
##D hw.test(x)
## End(Not run)
data(jaguar)
hw.test(jaguar)



