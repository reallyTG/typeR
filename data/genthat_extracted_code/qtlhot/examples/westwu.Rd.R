library(qtlhot)


### Name: ww.perm
### Title: Conduct West-Wu (Q) permutation tests
### Aliases: ww.perm summary.ww.perm print.ww.perm
### Keywords: utilities

### ** Examples

## Not run: 
##D ## All unspecified objects come from vignette qtlhot.
##D set.seed(12345)
##D Q.1 <- ww.perm(high1, n.perm = 100, lod.thrs, alphas)
##D Q.1.thr <- summary(Q.1, alphas)
##D Q.1.thr
##D diag(Q.1.thr)
##D 
##D set.seed(12345)
##D Q.2 <- ww.perm(high2, 100, lod.thrs, alphas)
##D Q.2.thr <- summary(Q.2, alphas)
## End(Not run)



