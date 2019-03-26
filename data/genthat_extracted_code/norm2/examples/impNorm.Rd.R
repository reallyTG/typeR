library(norm2)


### Name: impNorm
### Title: Imputation and prediction for incomplete multivariate normal
###   data
### Aliases: impNorm impNorm.default impNorm.formula impNorm.norm
### Keywords: multivariate NA

### ** Examples


## run EM for marijuana data with ridge prior
data(marijuana)
emResult <- emNorm(marijuana, prior="ridge", prior.df=0.5)

## generate 25 multiple imputations by running 25 chains
## of 100 iterations each, starting each chain at the 
## posterior mode
set.seed(456)
imp.list <- as.list(NULL)
for(m in 1:25){
   mcmcResult <- mcmcNorm(emResult, iter=100)
   imp.list[[m]] <- impNorm(mcmcResult)}




