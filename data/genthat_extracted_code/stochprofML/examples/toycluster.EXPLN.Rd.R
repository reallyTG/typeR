library(stochprofML)


### Name: toycluster.EXPLN
### Title: Synthetic data from the EXP-LN model
### Aliases: toycluster.EXPLN
### Keywords: datasets synthetic data stochastic profiling

### ** Examples

data(toycluster.EXPLN)
par(mfrow=c(3,4))
for (i in 1:ncol(toycluster.EXPLN)) {
   hist(toycluster.EXPLN[,i],xlab="synthetic data from EXP-LN model",
      main=colnames(toycluster.EXPLN)[i],col="grey")
}
par(mfrow=c(1,1))



