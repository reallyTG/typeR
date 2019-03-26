library(norm2)


### Name: mcmcNorm
### Title: MCMC algorithm for incomplete multivariate normal data
### Aliases: mcmcNorm mcmcNorm.default mcmcNorm.formula mcmcNorm.norm
### Keywords: multivariate NA

### ** Examples


## run EM for marijuana data with ridge prior
data(marijuana)
emResult <- emNorm(marijuana, prior="ridge", prior.df=0.5)

## run MCMC for 5,000 iterations starting from the 
## posterior mode using the same prior
mcmcResult <- mcmcNorm(emResult, iter=5000)

## summarize and plot worst linear function
summary(mcmcResult)
plot(mcmcResult$series.worst)
acf(mcmcResult$series.worst, lag.max=50)

## generate 25 multiple imputations, taking 
## 100 steps between imputations, and look st
## the first imputed dataset
mcmcResult <- mcmcNorm(emResult, iter=2500, impute.every=100)
mcmcResult$imp.list[[1]]




