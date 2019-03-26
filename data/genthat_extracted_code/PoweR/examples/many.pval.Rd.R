library(PoweR)


### Name: many.pval
### Title: Computes several p-values for many test statistics.
### Aliases: many.pval
### Keywords: htest

### ** Examples

stind <- c(43,44,42)   # Indices of test statistics.
alter <-list(stat43=3,stat44=3,stat42=3) # Type for each test.
# Several p-values computed under the null.
# You can increase the values of M and N for better results.
matrix.pval <- many.pval(stat.indices=stind,law.index=1,
                        n=100,M=10,N=10,alter=alter,null.dist=1,
                        method="direct")




