library(AssetCorr)


### Name: interCopula
### Title: Copula Based Maximum Likelihood Estimator
### Aliases: interCopula
### Keywords: Copula

### ** Examples

set.seed(10)
d1=defaultTimeseries(1000,0.1,10,0.01)
d2=defaultTimeseries(1000,0.2,10,0.01)
n=rep(1000,10)

df1=d1/n
df2=d2/n

InterCorr=interCopula(df1,df2, CI=0.95)


## No test: 
InterCorr=interCopula(df1,df2, JC=TRUE)

InterCorr=interCopula(df1,df2, B=1000, CI_Boot=0.95, plot=TRUE)

InterCorr=interCopula(df1,df2, DB=c(50,50))

## End(No test)



