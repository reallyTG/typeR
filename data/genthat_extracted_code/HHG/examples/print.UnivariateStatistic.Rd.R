library(HHG)


### Name: print.UnivariateStatistic
### Title: Print function for Univariate Statistic Test Object
### Aliases: print.UnivariateStatistic

### ** Examples


#generate statistics and test results, and print them
ind.stat = hhg.univariate.ind.stat(1:20,1:20,variant = 'ADP',
  aggregation.type = 'sum',score.type = 'both',mmax = 5)
print(ind.stat)

ks.stat = hhg.univariate.ks.stat(1:50,sample(c(rep(0,25),rep(1,25))),
  aggregation.type = 'both',score.type = 'both',mmax = 10)
print(ks.stat)

## Not run: 
##D 
##D ind.combined = hhg.univariate.ind.combined.test(1:20,1:20,
##D   combining.type = 'Both',mmax = 5,nr.perm = 100)
##D print(ind.combined)
##D 
## End(Not run)

ks.combined = hhg.univariate.ks.combined.test(1:50,
  sample(c(rep(0,25),rep(1,25))),combining.type = 'Both')
print(ks.combined)




