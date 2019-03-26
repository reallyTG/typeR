library(HHG)


### Name: hhg.univariate.ind.stat
### Title: The independence test statistics for all partition sizes
### Aliases: hhg.univariate.ind.stat

### ** Examples


## Not run: 
##D N = 35
##D data = hhg.example.datagen(N, 'Parabola')
##D X = data[1,]
##D Y = data[2,]
##D plot(X,Y)
##D 
##D 
##D #I) Computing test statistics , with default parameters(ADP statistic):
##D 
##D hhg.univariate.ADP.Likelihood.result = hhg.univariate.ind.stat(X,Y)
##D 
##D hhg.univariate.ADP.Likelihood.result
##D 
##D #II) Computing test statistics , with summation over Data Derived Partitions (DDP),
##D #using Pearson scores, and partition sizes up to 5:
##D 
##D hhg.univariate.DDP.Pearson.result = hhg.univariate.ind.stat(X,Y,variant = 'DDP',
##D   score.type = 'Pearson', mmax = 5)
##D hhg.univariate.DDP.Pearson.result
##D 
##D #III) Computing test statistics, for all M X L tables:
##D hhg.univariate.ADP.ML.Likelihood.result = hhg.univariate.ind.stat(X,Y,
##D variant='ADP-ML', mmax = 5)
##D 
##D hhg.univariate.ADP.ML.Likelihood.result
##D 
##D #IV) Computing test statistics, using efficient variants (for large data sets):
##D #Note : for independence testing with n>100, Fast.ADP.test is suggested
##D #rather than hhg.univariate.ind.stat.
##D 
##D N_Large = 1000
##D data_Large = hhg.example.datagen(N_Large, 'W')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D hhg.univariate.ADP.EQP.Likelihood.result = hhg.univariate.ind.stat(X_Large
##D ,Y_Large,variant='ADP-EQP', mmax = 20)
##D 
##D hhg.univariate.ADP.EQP.Likelihood.result
##D 
##D #note how only nr.atoms=76 are used - only 75 possible cell split locations are
##D #taken into consideration when computing the sum over all possible log likelihood scores.
##D #this can be changed using the nr.atoms argument:
##D 
##D hhg.univariate.ADP.EQP.Likelihood.result = hhg.univariate.ind.stat(X_Large,Y_Large,
##D variant='ADP-EQP',mmax = 20, nr.atoms =100)
##D 
##D hhg.univariate.ADP.EQP.Likelihood.result
##D 
##D #V) Computing the efficient sum over all MXL tables:
##D 
##D hhg.univariate.ADP.EQP.ML.Likelihood.result = hhg.univariate.ind.stat(X_Large,Y_Large,
##D variant='ADP-EQP-ML',mmax = 5)
##D 
##D hhg.univariate.ADP.EQP.ML.Likelihood.result
## End(Not run)




