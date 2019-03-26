library(Surrogate)


### Name: plot MaxEntICA BinBin
### Title: Plots the sensitivity-based and maximum entropy based Individual
###   Causal Association when S and T are binary outcomes
### Aliases: 'plot MaxEntICA BinBin' plot.MaxEntICA.BinBin
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Sensitivity BinBin Maximum Entropy

### ** Examples

# Sensitivity-based ICA results using ICA.BinBin.Grid.Sample
ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.341, pi0_1_=0.119, pi1_0_=0.254,
pi_1_1=0.686, pi_1_0=0.088, pi_0_1=0.078, Seed=1, 
Monotonicity=c("No"), M=5000)

# Maximum-entropy based ICA
MaxEnt <- MaxEntICABinBin(pi1_1_=0.341, pi0_1_=0.119, pi1_0_=0.254,
pi_1_1=0.686, pi_1_0=0.088, pi_0_1=0.078)

# Plot results
plot(x=MaxEnt, ICA.Fit=ICA)



