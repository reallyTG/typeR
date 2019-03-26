library(ExtMallows)


### Name: HEMM
### Title: A hierarchical extended Mallows model for aggregating multiple
###   ranking lists
### Aliases: HEMM

### ** Examples

data(simu3)
res=HEMM(rankings = simu3, num.kappa = 2, is.kappa.ranker = list(1:5, 6:10),
    initial.method = "mean", it.max = 20)
res$op.phi
res$op.phi1
res$op.omega
res$op.pi0

data(NBArankings)
res=HEMM(rankings = NBArankings, num.kappa = 1, is.kappa.ranker = list(1:6),
    initial.method = "mean", it.max = 20)
res$op.omega
res$op.pi0
res$op.kappa




