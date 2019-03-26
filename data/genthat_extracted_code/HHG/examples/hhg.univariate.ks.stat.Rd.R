library(HHG)


### Name: hhg.univariate.ks.stat
### Title: The K-sample test statistics for all partition sizes
### Aliases: hhg.univariate.ks.stat

### ** Examples

#Example of computing the test statisics for data from a two-sample problem:

#Two groups, each from a different normal mixture:
X = c(c(rnorm(25,-2,0.7),rnorm(25,2,0.7)),c(rnorm(25,-1.5,0.5),rnorm(25,1.5,0.5)))
Y = (c(rep(0,50),rep(1,50)))
plot(Y,X)


#I) Computing test statistics , with default parameters:
hhg.univariate.Sm.Likelihood.result = hhg.univariate.ks.stat(X,Y)

hhg.univariate.Sm.Likelihood.result

#II) Computing test statistics , with max aggregation type:
hhg.univariate.Mm.likelihood.result = hhg.univariate.ks.stat(X,Y,aggregation.type = 'max')

hhg.univariate.Mm.likelihood.result


#III) Computing statistics, which are computationaly efficient for large data:

#Two groups, each from a different normal mixture, total sample size is 10^4:
X_Large = c(c(rnorm(2500,-2,0.7),rnorm(2500,2,0.7)),
c(rnorm(2500,-1.5,0.5),rnorm(2500,1.5,0.5)))
Y_Large = (c(rep(0,5000),rep(1,5000)))
plot(Y_Large,X_Large)

# for these variants, make sure to change mmax so that mmax<= nr.atoms

hhg.univariate.Sm.EQP.Likelihood.result = hhg.univariate.ks.stat(X_Large,Y_Large,
variant = 'KSample-Equipartition',mmax=30)

hhg.univariate.Sm.EQP.Likelihood.result

hhg.univariate.Mm.EQP.likelihood.result = hhg.univariate.ks.stat(X_Large,Y_Large,
aggregation.type = 'max',variant = 'KSample-Equipartition',mmax=30)

hhg.univariate.Mm.EQP.likelihood.result




