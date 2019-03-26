library(OpenRepGrid)


### Name: constructPca
### Title: Principal component analysis (PCA) of inter-construct
###   correlations.
### Aliases: constructPca

### ** Examples

## Not run: 
##D 
##D    constructPca(bell2010)
##D    
##D    # data from grid manual by Fransella et al. (2003, p. 87)
##D    # note that the construct order is different
##D    constructPca(fbb2003, nfactors=2)
##D 
##D    # no rotation
##D    constructPca(fbb2003, rotate="none")
##D    
##D    # use a different type of correlation (Spearman)
##D    constructPca(fbb2003, method="spearman")
##D    
##D    # save output to object           
##D    m <- constructPca(fbb2003, nfactors=2)
##D    m
##D    
##D    # different printing options
##D    print(m, digits=5)
##D    print(m, cutoff=.3)
##D    
## End(Not run)




