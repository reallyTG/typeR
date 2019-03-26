library(marked)


### Name: hmmDemo
### Title: HMM computation demo functions
### Aliases: hmmDemo
### Keywords: models

### ** Examples

## No test: 
# This example is excluded from testing to reduce package check time
# cormack-jolly-seber model
data(dipper)
mod=crm(dipper,model="hmmcjs")
x=hmmDemo(mod,state.names=c("Alive","Dead"),obs.names=c("Missed","Seen"))
par(mfrow=c(2,1))
barplot(t(x$alpha[45,,]),beside=TRUE,names.arg=x$chforwardstrings)
barplot(t(x$phi[45,,]),beside=TRUE,names.arg=x$chforwardstrings)
# multi-state example showing state predictions
data(mstrata)
mod=crm(mstrata,model="hmmMSCJS",strata.labels=c("A","B","C"))
#' x=hmmDemo(mod)
# state predictions are normalized by likelihood value which = rowSums(alpha*beta)
cat(paste("\nrowsums = ",rowSums(x$alpha[45,,]*x$beta[45,,],na.rm=TRUE)[2],
   "which matches likelihood value",exp(x$lnl[45]),"\n"))
# state predictions given the data
x$stateprob[45,,]
## End(No test)



