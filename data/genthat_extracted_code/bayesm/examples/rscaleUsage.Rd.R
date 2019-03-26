library(bayesm)


### Name: rscaleUsage
### Title: MCMC Algorithm for Multivariate Ordinal Data with Scale Usage
###   Heterogeneity
### Aliases: rscaleUsage
### Keywords: models

### ** Examples

if(nchar(Sys.getenv("LONG_TEST")) != 0) {R=1000} else {R=5} 
set.seed(66)

data(customerSat)
surveydat = list(k=10, x=as.matrix(customerSat))

out = rscaleUsage(Data=surveydat, Mcmc=list(R=R))
summary(out$mudraw)



