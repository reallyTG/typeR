library(Surrogate)


### Name: plot MaxEntSPF BinBin
### Title: Plots the sensitivity-based and maximum entropy based surrogate
###   predictive function (SPF) when S and T are binary outcomes.
### Aliases: 'plot MaxEntSPF BinBin' plot.MaxEntSPF.BinBin
### Keywords: Plot SPF Causal-Inference framework Sensitivity Maximum
###   Entropy

### ** Examples

# Sensitivity-based ICA results using ICA.BinBin.Grid.Sample
ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.341, pi0_1_=0.119, pi1_0_=0.254,
pi_1_1=0.686, pi_1_0=0.088, pi_0_1=0.078, Seed=1, 
Monotonicity=c("No"), M=5000)

# Sensitivity-based SPF
SPFSens <- SPF.BinBin(ICA)

# Maximum-entropy based SPF
SPFMaxEnt <- MaxEntSPFBinBin(pi1_1_=0.341, pi0_1_=0.119, pi1_0_=0.254,
pi_1_1=0.686, pi_1_0=0.088, pi_0_1=0.078)

# Plot results
plot(x=SPFMaxEnt, SPF.Fit=SPFSens)



