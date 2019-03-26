library(vennLasso)


### Name: genHierSparseBeta
### Title: function to generate coefficient matrix with hierarchical
###   sparsity
### Aliases: genHierSparseBeta

### ** Examples

set.seed(123)

# estimate hier.sparsity.param for 0.15 total proportion of nonzero variables
# among vars with hierarchical zero patterns
# NOT RUN: Takes a long time
# hsp <- estimate.hier.sparsity.param(ncats = 3, nvars = 25, avg.hier.zeros = 0.15, nsims = 100)
# the above results in the following value
hsp <- 0.6341772

# check that this does indeed achieve the desired level of sparsity
mean(replicate(100, mean(genHierSparseBeta(ncats = 3, 
                           nvars = 25, hier.sparsity.param = hsp) != 0)  ))

sparseBeta <- genHierSparseBeta(ncats = 3, nvars = 25, hier.sparsity.param = hsp)




