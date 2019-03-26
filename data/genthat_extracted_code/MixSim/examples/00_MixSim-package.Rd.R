library(MixSim)


### Name: MixSim-package
### Title: Simulation of Gaussian Finite Mixture Models
### Aliases: 00_MixSim-package

### ** Examples

# Simulate parameters of a mixture model
A <- MixSim(BarOmega = 0.01, MaxOmega = 0.10, K = 10, p = 5)

# Display the mixture via the parallel distribution plot
pdplot(A$Pi, A$Mu, A$S, MaxInt = 0.5)



