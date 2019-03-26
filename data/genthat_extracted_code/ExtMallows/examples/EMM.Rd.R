library(ExtMallows)


### Name: EMM
### Title: An extended Mallows model for aggregating multiple ranking lists
### Aliases: EMM

### ** Examples

data(simu1)
res=EMM(rankings = simu1, initial.method = "mean", it.max = 20)
res$op.phi
res$op.omega
res$op.pi0




