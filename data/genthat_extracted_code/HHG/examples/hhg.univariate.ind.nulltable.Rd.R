library(HHG)


### Name: hhg.univariate.ind.nulltable
### Title: Null tables for the distribution-free test of independence
### Aliases: hhg.univariate.ind.nulltable

### ** Examples

## Not run: 
##D #Testing for independance, sample size = 35
##D N=35
##D 
##D #null table for aggregation by summation (on ADP): 
##D ADP.null = hhg.univariate.ind.nulltable(N)
##D 
##D #create a null table, using aggregation by summation over DDP partitions,
##D #with partitions sizes up to 5, over Pearson scores, with 1000 bootstrap repetitions.
##D DDP.null = hhg.univariate.ind.nulltable(N,mmax = 5,variant = 'DDP',
##D score.type = 'Pearson', nr.replicates = 1000)
##D 
##D #Create a null table for the ADP-EQP and ADP-EQP-ML variants, 
##D #which are tailored for independece testing, with larger n (n>100):
##D 
##D N_large =200
##D ADP.EQP.null = hhg.univariate.ind.nulltable(N_large, variant = 'ADP-EQP',nr.atoms = 40)
##D 
##D #Null table for the sum of log likelihood scores over all possible M X L tables:
##D ADP.EQP.ML.null = hhg.univariate.ind.nulltable(N_large, variant = 'ADP-EQP-ML',
##D   nr.atoms = 30,nr.replicates=200)
##D 
## End(Not run)




