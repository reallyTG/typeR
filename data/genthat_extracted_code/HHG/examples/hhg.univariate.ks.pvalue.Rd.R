library(HHG)


### Name: hhg.univariate.ks.pvalue
### Title: The p-value computation for the K-sample problem using a fixed
###   partition size
### Aliases: hhg.univariate.ks.pvalue

### ** Examples

## Not run: 
##D 
##D #Two groups, each from a different normal mixture:
##D N0=30
##D N1=30
##D X = c(c(rnorm(N0/2,-2,0.7),rnorm(N0/2,2,0.7)),c(rnorm(N1/2,-1.5,0.5),rnorm(N1/2,1.5,0.5)))
##D Y = (c(rep(0,N0),rep(1,N1)))
##D plot(Y,X)
##D 
##D #I)p-value for fixed partition size using the sum aggregation type
##D hhg.univariate.Sm.Likelihood.result = hhg.univariate.ks.stat(X,Y)
##D hhg.univariate.Sm.Likelihood.result
##D 
##D 
##D sum.nulltable = hhg.univariate.ks.nulltable(c(N0,N1), nr.replicates=100)
##D #default nr. of replicates is 1000, but may take several seconds.
##D #For illustration only, we use 100 replicates, but it is highly recommended
##D #to use at least 1000 in practice. 
##D 
##D #p-value for m=4 (the default):
##D hhg.univariate.ks.pvalue(hhg.univariate.Sm.Likelihood.result, sum.nulltable, m=4)
##D 
##D 
##D #p-value for m=2:
##D hhg.univariate.ks.pvalue(hhg.univariate.Sm.Likelihood.result, sum.nulltable, m=2)
##D 
##D #II) p-value for fixed partition size using the max aggregation type
##D 
##D hhg.univariate.Mm.likelihood.result = hhg.univariate.ks.stat(X,Y,aggregation.type = 'max')
##D 
##D hhg.univariate.Mm.likelihood.result
##D 
##D max.nulltable = hhg.univariate.ks.nulltable(c(N0,N1), aggregation.type = 'max',
##D   score.type='LikelihoodRatio', mmin = 3, mmax = 5, nr.replicates = 100)
##D #default nr. of replicates is 1000, but may take several seconds.
##D #For illustration only, we use 100 replicates,
##D #but it is highly recommended to use at least 1000 in practice.
##D 
##D #p-value for m=3:
##D hhg.univariate.ks.pvalue(hhg.univariate.Mm.likelihood.result, max.nulltable ,m = 3) 
##D 
##D #p-value for m=5:
##D hhg.univariate.ks.pvalue(hhg.univariate.Mm.likelihood.result, max.nulltable,m = 5)
##D 
##D 
##D #III) p-value for sum and max aggregation type, using large data variants:
##D 
##D #Two groups, each from a different normal mixture, total sample size is 10^4:
##D X_Large = c(c(rnorm(2500,-2,0.7),rnorm(2500,2,0.7)),
##D c(rnorm(2500,-1.5,0.5),rnorm(2500,1.5,0.5)))
##D Y_Large = (c(rep(0,5000),rep(1,5000)))
##D plot(Y_Large,X_Large)
##D 
##D # for these variants, make sure to change mmax so that mmax<= nr.atoms
##D 
##D hhg.univariate.Sm.EQP.Likelihood.result = hhg.univariate.ks.stat(X_Large,Y_Large,
##D variant = 'KSample-Equipartition',mmax=30)
##D hhg.univariate.Mm.EQP.likelihood.result = hhg.univariate.ks.stat(X_Large,Y_Large,
##D aggregation.type = 'max',variant = 'KSample-Equipartition',mmax=30)
##D 
##D N0_large = 5000
##D N1_large = 5000
##D 
##D Sm.EQP.null.table = hhg.univariate.ks.nulltable(c(N0_large,N1_large), nr.replicates=200,
##D variant = 'KSample-Equipartition', mmax = 30)
##D Mm.EQP.null.table = hhg.univariate.ks.nulltable(c(N0_large,N1_large), nr.replicates=200,
##D aggregation.type='max', variant = 'KSample-Equipartition', mmax = 30)
##D 
##D hhg.univariate.ks.pvalue(hhg.univariate.Sm.EQP.Likelihood.result, Sm.EQP.null.table, m=5)
##D hhg.univariate.ks.pvalue(hhg.univariate.Mm.EQP.likelihood.result, Mm.EQP.null.table, m=5)
##D 
## End(Not run)




