library(palaeoSig)


### Name: obs.cor
### Title: Weighted correlation between weighted averaging optima and
###   constrained ordination species scores.
### Aliases: obs.cor plot.obscor identify.obscor
### Keywords: multivariate htest hplot

### ** Examples

require(rioja)
data(SWAP)
data(RLGH)

rlgh.obs <- obs.cor(spp = sqrt(SWAP$spec), env = SWAP$pH, fos = sqrt(RLGH$spec))
rlgh.obs$sig
plot(rlgh.obs, which=1)
plot(rlgh.obs, which=2)




