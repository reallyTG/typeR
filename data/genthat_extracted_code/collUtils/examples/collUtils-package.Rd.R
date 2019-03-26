library(collUtils)


### Name: collUtils-package
### Title: A auxiliary package for CollapsABEL.
### Aliases: collUtils-package collUtils
### Keywords: GWAS Compound heterozygosity Genomics

### ** Examples

## Not run: 
##D require(collUtils)
##D rbed_obj = rBed("test.bed")
##D geno = rbed_obj$readBed()
##D geno = getJArray(geno)
##D print(geno)
##D fn = tempfile()
##D f = file(fn, "wb")
##D writeBin("a", f)
##D writeBin("b", f)
##D writeBin("c", f)
##D close(f)
##D file.info(fn)$size == 6
##D truncateEndOfFile(fn, 1)
## End(Not run)



