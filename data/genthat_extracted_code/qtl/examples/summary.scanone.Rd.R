library(qtl)


### Name: summary.scanone
### Title: Summarize the results of a genome scans
### Aliases: summary.scanone
### Keywords: print

### ** Examples

## Don't show: 
set.seed(70377314)
## End(Don't show)
data(fake.bc)
## Don't show: 
fake.bc <- subset(fake.bc, chr=c(2,5,6))
## End(Don't show)
fake.bc <- calc.genoprob(fake.bc, step=5)

# genome scan by Haley-Knott regression
out <- scanone(fake.bc, method="hk")

# permutation tests
## Not run: operm <- scanone(fake.bc, method="hk", n.perm=1000)
## Don't show: 
operm <- scanone(fake.bc, method="hk", n.perm=100)
## End(Don't show)

# peaks for all chromosomes
summary(out)

# results with LOD >= 3
summary(out, threshold=3)

# the same, but also showing the p-values
summary(out, threshold=3, perms=operm, pvalues=TRUE)

# results with LOD meeting the 0.05 threshold from the permutation results
summary(out, perms=operm, alpha=0.05)

# the same, also showing the p-values
summary(out, perms=operm, alpha=0.05, pvalues=TRUE)

##### summary with multiple phenotype results
out2 <- scanone(fake.bc, pheno.col=1:2, method="hk")

# permutations
## Not run: operm2 <- scanone(fake.bc, pheno.col=1:2, method="hk", n.perm=1000)
## Don't show: 
operm2 <- scanone(fake.bc, pheno.col=1:2, method="hk", n.perm=100)
## End(Don't show)

# results with LOD >= 2 for the 1st phenotype and >= 1 for the 2nd phenotype
#     using format="allpheno"
summary(out2, thr=c(2, 1), format="allpheno")

# The same with format="allpeaks"
summary(out2, thr=c(2, 1), format="allpeaks")

# The same with p-values
summary(out2, thr=c(2, 1), format="allpeaks", perms=operm2, pvalues=TRUE)

# results with LOD meeting the 0.05 significance level by the permutations
#     using format="allpheno"
summary(out2, format="allpheno", perms=operm2, alpha=0.05)

# The same with p-values
summary(out2, format="allpheno", perms=operm2, alpha=0.05, pvalues=TRUE)

# The same with format="allpeaks"
summary(out2, format="allpeaks", perms=operm2, alpha=0.05, pvalues=TRUE)

# format="tabByCol"
summary(out2, format="tabByCol", perms=operm2, alpha=0.05, pvalues=TRUE)

# format="tabByChr", but using bayes intervals
summary(out2, format="tabByChr", perms=operm2, alpha=0.05, pvalues=TRUE,
        ci.function="bayesint")

# format="tabByChr", but using 99% bayes intervals
summary(out2, format="tabByChr", perms=operm2, alpha=0.05, pvalues=TRUE,
        ci.function="bayesint", prob=0.99)



