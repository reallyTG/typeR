library(poppr)


### Name: genclone-class
### Title: GENclone and SNPclone classes
### Aliases: genclone-class genclone snpclone-class snpclone

### ** Examples

## Not run: 
##D 
##D # genclone objects can be created from genind objects
##D #
##D data(partial_clone)
##D partial_clone
##D (pc <- as.genclone(partial_clone))
##D 
##D # snpclone objects can be created from genlight objects
##D #
##D set.seed(999)
##D (gl <- glSim(100, 0, n.snp.struc = 1e3, ploidy = 2, parallel = FALSE))
##D (sc <- as.snpclone(rbind(gl, gl, parallel = FALSE), parallel = FALSE))
##D # 
##D # Use mlg.filter to create a distance threshold to define multilocus genotypes.
##D mlg.filter(sc, threads = 1L) <- 0.25
##D sc # 82 mlgs
##D 
## End(Not run)



