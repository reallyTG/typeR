library(HHG)


### Name: hhg.univariate.ind.pvalue
### Title: The p-value computation for the test of independence using a
###   fixed partition size
### Aliases: hhg.univariate.ind.pvalue

### ** Examples


## Not run: 
##D N = 35
##D data = hhg.example.datagen(N, 'Parabola')
##D X = data[1,]
##D Y = data[2,]
##D plot(X,Y)
##D 
##D 
##D #I) Computing test statistics , with default parameters:
##D 
##D #statistic:
##D hhg.univariate.ADP.Likelihood.result = hhg.univariate.ind.stat(X,Y)
##D hhg.univariate.ADP.Likelihood.result
##D 
##D #null table:
##D ADP.null = hhg.univariate.ind.nulltable(N)
##D #pvalue:
##D hhg.univariate.ind.pvalue(hhg.univariate.ADP.Likelihood.result, ADP.null)
##D 
##D #II) Computing test statistics , with summation over Data Derived Partitions (DDP),
##D #using Pearson scores, and partition sizes up to 5:
##D 
##D #statistic:
##D hhg.univariate.DDP.Pearson.result = hhg.univariate.ind.stat(X,Y,variant = 'DDP',
##D   score.type = 'Pearson', mmax = 5)
##D hhg.univariate.DDP.Pearson.result
##D 
##D #null table:
##D DDP.null = hhg.univariate.ind.nulltable(N,mmax = 5,variant = 'DDP',
##D   score.type = 'Pearson', nr.replicates = 1000)
##D   
##D #pvalue , for different partition size:
##D hhg.univariate.ind.pvalue(hhg.univariate.DDP.Pearson.result, DDP.null, m =2)
##D hhg.univariate.ind.pvalue(hhg.univariate.DDP.Pearson.result, DDP.null, m =5)
##D 
##D 
##D #III) computing P-value for the variants used for large N:
##D 
##D N_Large = 1000
##D data_Large = hhg.example.datagen(N_Large, 'W')
##D X_Large = data_Large[1,]
##D Y_Large = data_Large[2,]
##D plot(X_Large,Y_Large)
##D 
##D NullTable_ADP_EQP = hhg.univariate.ind.nulltable(N_Large, variant = 'ADP-EQP',
##D   nr.atoms = 30,nr.replicates=200)
##D NullTable_ADP_EQP_ML = hhg.univariate.ind.nulltable(N_Large,
##D variant = 'ADP-EQP-ML',nr.atoms = 30,nr.replicates=200)
##D 
##D ADP_EQP_result = hhg.univariate.ind.stat(X_Large,Y_Large,variant = 'ADP-EQP',
##D nr.atoms =30)
##D ADP_EQP_ML_result = hhg.univariate.ind.stat(X_Large,Y_Large,variant='ADP-EQP-ML',
##D nr.atoms = 30)
##D 
##D #P-value for the S_(5X5) statistic, the sum over all 5X5 partitions:
##D hhg.univariate.ind.pvalue(ADP_EQP_result,NullTable_ADP_EQP,m=5 )
##D 
##D #P-value for the S_(5X3) statistic, the sum over all 5X3 partitions:
##D hhg.univariate.ind.pvalue(ADP_EQP_ML_result,NullTable_ADP_EQP_ML,m=5,l=3)
##D 
## End(Not run)




