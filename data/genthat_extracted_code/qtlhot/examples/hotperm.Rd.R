library(qtlhot)


### Name: hotperm
### Title: Conduct NL and N permutation tests
### Aliases: hotperm print.hotperm summary.hotperm quantile.hotperm
###   print.summary.hotperm hotperm1
### Keywords: utilities

### ** Examples

example(include.hotspots)
set.seed(123)
pt <- scanone(ncross1, method = "hk", n.perm = 1000)
alphas <- seq(0.01, 0.10, by=0.01)
lod.thrs <- summary(pt, alphas)
## Not run: 
##D ## This takes awhile, so we save the object.
##D set.seed(12345)
##D hotperm1 <- hotperm(cross = cross1,
##D                     n.quant = 300,
##D                     n.perm = 100,
##D                     lod.thrs = lod.thrs,
##D                     alpha.levels = alphas,
##D                     drop.lod = 1.5,
##D                     verbose = FALSE)
##D save(hotperm1, file = "hotperm1.RData", compress = TRUE)
## End(Not run)
summary(hotperm1)



