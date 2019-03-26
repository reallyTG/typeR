library(MoEClust)


### Name: MoE_plotLogLik
### Title: Plot the Log-Likelihood of a MoEClust Mixture Model
### Aliases: MoE_plotLogLik
### Keywords: plotting

### ** Examples

data(ais)
res <- MoE_clust(ais[,3:7], gating= ~ BMI, expert= ~ sex,
                 G=2, modelNames="EVE", network.data=ais)
(ll <- MoE_plotLogLik(res))



