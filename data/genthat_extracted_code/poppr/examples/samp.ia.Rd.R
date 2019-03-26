library(poppr)


### Name: samp.ia
### Title: Calculate random samples of the index of association for
###   genlight objects.
### Aliases: samp.ia

### ** Examples

# with structured snps assuming 1e4 positions
set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 5e2, 
           n.snp.struc = 5e2, ploidy = 2,
           parallel = FALSE)
position(x) <- sort(sample(1e4, 1e3))
res <- samp.ia(x)
hist(res, breaks = "fd")

# with unstructured snps assuming 1e4 positions
set.seed(999)
x <- glSim(n.ind = 10, n.snp.nonstruc = 1e3, ploidy = 2)
position(x) <- sort(sample(1e4, 1e3))
res <- samp.ia(x)
hist(res, breaks = "fd")



