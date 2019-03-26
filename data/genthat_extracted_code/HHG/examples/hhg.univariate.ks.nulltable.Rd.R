library(HHG)


### Name: hhg.univariate.ks.nulltable
### Title: The K-sample test null tables for all partition sizes
### Aliases: hhg.univariate.ks.nulltable

### ** Examples

## Not run: 
##D #Testing for the difference between two groups, each from a normal mixture:
##D N0=30
##D N1=30
##D 
##D #null table for aggregation by summation: 
##D sum.nulltable = hhg.univariate.ks.nulltable(c(N0,N1), nr.replicates=100)
##D #default nr. of replicates is 1000,
##D #but may take several seconds. For illustration only, we use 100 replicates,
##D #but it is highly recommended to use at least 1000 in practice. 
##D 
##D #null table for aggregation by maximization: 
##D max.nulltable = hhg.univariate.ks.nulltable(c(N0,N1), aggregation.type = 'max',
##D   score.type='LikelihoodRatio', mmin = 3, mmax = 5, nr.replicates = 100)
##D #default nr. of replicates is 1000, but may take several seconds. For illustration only,
##D #we use 100 replicates, but it is highly recommended to use at least 1000 in practice.
##D 
##D #null tables for aggregation by summation and maximization, for large data variants:
##D #make sure to change mmax, such that mmax<= nr.atoms
##D 
##D N0_large = 5000
##D N1_large = 5000
##D 
##D Sm.EQP.null.table = hhg.univariate.ks.nulltable(c(N0_large,N1_large),
##D nr.replicates=200, variant = 'KSample-Equipartition', mmax = 30)
##D Mm.EQP.null.table = hhg.univariate.ks.nulltable(c(N0_large,N1_large),
##D nr.replicates=200, aggregation.type='max', variant = 'KSample-Equipartition', mmax = 30)
## End(Not run)




