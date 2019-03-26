library(stochprofML)


### Name: toycluster.rLNLN
### Title: Synthetic data from the rLN-LN model
### Aliases: toycluster.rLNLN
### Keywords: datasets synthetic data stochastic profiling

### ** Examples

data(toycluster.rLNLN)
par(mfrow=c(3,4))
for (i in 1:ncol(toycluster.rLNLN)) {
   hist(toycluster.rLNLN[,i],xlab="synthetic data from rLN-LN model",
      main=colnames(toycluster.rLNLN)[i],col="grey")
}
par(mfrow=c(1,1))



