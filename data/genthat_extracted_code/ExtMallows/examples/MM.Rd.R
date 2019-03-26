library(ExtMallows)


### Name: MM
### Title: The Mallows model for aggregating multiple ranking lists
### Aliases: MM

### ** Examples

data(simu1)
res=MM(rankings = simu1, initial.method = "mean", it.max = 20)
res$op.phi
res$op.pi0




