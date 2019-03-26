library(CorrBin)


### Name: uniprobs
### Title: Extract univariate marginal probabilities from joint probability
###   arrays
### Aliases: uniprobs

### ** Examples

data(dehp)
tau <- jointprobs(dehp, type="averaged")
uniprobs(tau)

#separately for each cluster size
tau2 <- jointprobs(dehp, type="cluster")
uniprobs(tau2)



