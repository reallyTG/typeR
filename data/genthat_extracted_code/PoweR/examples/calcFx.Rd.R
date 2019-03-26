library(PoweR)


### Name: calcFx
### Title: Empirical distribution function of p-values.
### Aliases: calcFx
### Keywords: nonparametric

### ** Examples

stind <- c(43, 44, 42)   # Indices of test statistics.
alter <-list(stat43 = 3, stat44 = 3, stat42 = 3) # Type for each test.
# Several p-values computed under the null.
pnull <- many.pval(stat.indices = stind, law.index = 1,
                        n = 100, M = 10, N = 10, alter = alter,
                        null.dist = 1,
                        method = "direct")$pvals
xnull <- calcFx(pnull)



