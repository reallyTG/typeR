library(vennLasso)


### Name: estimate.hier.sparsity.param
### Title: function to estimate the hierarchical sparsity parameter for a
###   desired level of sparsity for simulated hierarchical coefficients
### Aliases: estimate.hier.sparsity.param

### ** Examples

set.seed(123)


# estimate hier.sparsity.param for 0.15 total proportion of nonzero variables
# among vars with hierarchical zero patterns
## Not run: 
##D hsp <- estimate.hier.sparsity.param(ncats = 3, nvars = 25, avg.hier.zeros = 0.15, nsims = 100)
## End(Not run)
# the above results in the following value
hsp <- 0.6341772

# check that this does indeed achieve the desired level of sparsity
mean(replicate(100, mean(genHierSparseBeta(ncats = 3, 
                           nvars = 25, hier.sparsity.param = hsp) != 0)  ))

sparseBeta <- genHierSparseBeta(ncats = 3, nvars = 25, hier.sparsity.param = hsp)


## Not run: 
##D hsp2 <- estimate.hier.sparsity.param(ncats = 2, nvars = 100, 
##D                         avg.hier.zeros = 0.30, nsims = 50) # 0.5778425
##D hsp3 <- estimate.hier.sparsity.param(ncats = 3, nvars = 100, 
##D                         avg.hier.zeros = 0.30, nsims = 50) # 0.4336312
##D hsp4 <- estimate.hier.sparsity.param(ncats = 4, nvars = 100, 
##D                         avg.hier.zeros = 0.30, nsims = 50) # 0.2670061
##D hsp5 <- estimate.hier.sparsity.param(ncats = 5, nvars = 100, 
##D                         avg.hier.zeros = 0.30, nsims = 50) # 0.146682
## End(Not run)
# 0.07551241 for hsp6




