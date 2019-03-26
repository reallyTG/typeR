library(GMAC)


### Name: gmac
### Title: Genomic Mediation analysis with Adaptive Confounding adjustment
### Aliases: gmac

### ** Examples

data(example)

# a fast example with only 50 permutations
output <- gmac(known.conf = dat$known.conf, cov.pool = dat$cov.pool, 
    exp.dat = dat$exp.dat, snp.dat.cis = dat$snp.dat.cis, 
    trios.idx = dat$trios.idx[1:40, ], nperm = 50, nominal.p = TRUE)

plot(output)


## Not run: 
##D ## the construction of PCs as cov.pool
##D pc <- prcomp(t(dat$exp.dat), scale = T)
##D cov.pool <- t(pc$x)
##D 
##D 
##D ## generate a cluster with 2 nodes for parallel computing
##D cl <- makeCluster(2)
##D output <- gmac(cl = cl, known.conf = dat$known.conf, cov.pool = cov.pool, 
##D     exp.dat = dat$exp.dat, snp.dat.cis = dat$snp.dat.cis, 
##D     trios.idx = dat$trios.idx, nominal.p = TRUE)
##D stopCluster(cl)
## End(Not run)



