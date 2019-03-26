library(CorrBin)


### Name: jointprobs
### Title: Estimate joint event probabilities for multinomial data
### Aliases: jointprobs

### ** Examples

data(dehp)
# averaged over cluster-sizes
tau.ave <- jointprobs(dehp, type="ave")
# averaged P(X1=X2=O1, X3=O2) in the 1500 dose group
tau.ave[["1500"]]["2","1"]  # there are two type-1, and one type-2 outcome

#plot P(X1=O1) - the marginal probability of a type-1 event over cluster-sizes
tau <- jointprobs(dehp, type="cluster")
ests <- as.data.frame(lapply(tau, function(x)x[,"1","0"]))
matplot(ests, type="b")



