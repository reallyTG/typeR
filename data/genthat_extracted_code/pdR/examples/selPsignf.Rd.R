library(pdR)


### Name: selPsignf
### Title: Selection of lags.
### Aliases: selPsignf

### ** Examples

data(inf_Q)
y=inf_Q[,1]
hegy.out<-HEGY.test(wts=y, itsd=c(1,0,c(1:3)),regvar=0, selectlags=list(mode="signf", Pmax=12))
hegy.out$lagsorder
hegy.out$lagcoefs



