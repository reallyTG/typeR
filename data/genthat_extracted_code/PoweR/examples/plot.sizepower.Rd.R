library(PoweR)


### Name: plot.sizepower
### Title: size-power curves.
### Aliases: plot.sizepower
### Keywords: hplot

### ** Examples

## You can increase M for better results:
stind <- c(43,44,42)   # Indices of test statistics.
alter <-list(stat43=3,stat44=3,stat42=3) # Type for each test.
# Several p-values computed under the null.
pnull <- many.pval(stat.indices=stind,law.index=1,
                   n=100,M=100,N=10,alter=alter,null.dist=2,
                   method="MC")$pvals
Fxnull <- calcFx(pnull)
p <- many.pval(stat.indices=stind,law.index=4,n=100,
               M=100,N=10,alter=alter,null.dist=2,
               method="MC")$pvals
Fx <- calcFx(p)
plot.sizepower(Fx,Fxnull)



