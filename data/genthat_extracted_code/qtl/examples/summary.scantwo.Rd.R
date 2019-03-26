library(qtl)


### Name: summary.scantwo
### Title: Summarize the results of a two-dimensional genome scan
### Aliases: summary.scantwo
### Keywords: print

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(1,8,13,"X"))
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2, step=5)
out.2dim <- scantwo(fake.f2, method="hk")

# All pairs of chromosomes
summary(out.2dim)

# Chromosome pairs meeting specified criteria
summary(out.2dim, thresholds=c(9.1, 7.1, 6.3, 6.3, 3.3))

# Similar, but ignoring the interaction LOD score in the rule
summary(out.2dim, thresholds=c(9.1, 7.1, Inf, 6.3, 3.3))

# Pairs having largest interaction LOD score, if it's > 4
summary(out.2dim, thresholds=c(0, Inf, 4, Inf, Inf), what="int")

# permutation test to get thresholds; run in two batches
#     and then combined with c.scantwoperm
## Not run: 
##D operm.2dimA <- scantwo(fake.f2, method="hk", n.perm=500)
##D operm.2dimB <- scantwo(fake.f2, method="hk", n.perm=500)
##D operm.2dim <- c(operm.2dimA, operm.2dimB)
## End(Not run)
## Don't show: 
strata <- pull.pheno(fake.f2, "sex") + pull.pheno(fake.f2, "pgm")*2
operm.2dim <- scantwo(fake.f2, method="hk", n.perm=100, perm.strata=strata)
## End(Don't show)

# estimated LOD thresholds
summary(operm.2dim)

# Summary, citing significance levels and so estimating thresholds
#     from the permutation results
summary(out.2dim, perms=operm.2dim, alpha=rep(0.05, 5))

# Similar, but ignoring the interaction LOD score in the rule
summary(out.2dim, perms=operm.2dim, alpha=c(0.05, 0.05, 0, 0.05, 0.05))

# Similar, but also getting genome-scan-adjusted p-values
summary(out.2dim, perms=operm.2dim, alpha=c(0.05, 0.05, 0, 0.05, 0.05),
        pvalues=TRUE)



