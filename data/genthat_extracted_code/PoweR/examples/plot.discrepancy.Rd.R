library(PoweR)


### Name: plot.discrepancy
### Title: p-value discrepancy plot.
### Aliases: plot.discrepancy
### Keywords: hplot

### ** Examples

stind <- c(43,44,42)   # Indices of test statistics.
alter <-list(stat43=3,stat44=3,stat42=3) # Type for each test.
# Several p-values computed under the null.
pnull <- many.pval(stat.indices=stind,law.index=1,
                   n=100,N=10,alter=alter,null.dist=1,
                   method="direct")$pvals
xnull <- calcFx(pnull)
plot.discrepancy(xnull)



