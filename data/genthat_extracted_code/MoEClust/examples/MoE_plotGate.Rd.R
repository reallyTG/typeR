library(MoEClust)


### Name: MoE_plotGate
### Title: Plot MoEClust Gating Network
### Aliases: MoE_plotGate
### Keywords: plotting

### ** Examples

data(ais)
res   <- MoE_clust(ais[,3:7], gating= ~ BMI, G=3, modelNames="EEE",
                   network.data=ais, noise.gate=FALSE, tau0=0.1)

# Plot against the observation index and examine the gating network coefficients
(gate <- MoE_plotGate(res))

# Plot against BMI
MoE_plotGate(res, x.axis=ais$BMI, type="p", xlab="BMI", pch=1)



