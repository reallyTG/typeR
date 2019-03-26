library(stochprofML)


### Name: toycluster.LNLN
### Title: Synthetic data from the LN-LN model
### Aliases: toycluster.LNLN
### Keywords: datasets synthetic data stochastic profiling

### ** Examples

data(toycluster.LNLN)
par(mfrow=c(3,4))
for (i in 1:ncol(toycluster.LNLN)) {
   hist(toycluster.LNLN[,i],xlab="synthetic data from LN-LN model",
      main=colnames(toycluster.LNLN)[i],col="grey")
}
par(mfrow=c(1,1))



