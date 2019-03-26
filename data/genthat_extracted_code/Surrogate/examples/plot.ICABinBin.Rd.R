library(Surrogate)


### Name: plot Causal-Inference BinBin
### Title: Plots the (Meta-Analytic) Individual Causal Association and
###   related metrics when S and T are binary outcomes
### Aliases: 'plot Causal-Inference BinBin' plot.ICA.BinBin
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Sensitivity

### ** Examples

# Compute R2_H given the marginals, 
# assuming monotonicity for S and T and grids
# pi_0111=seq(0, 1, by=.001) and 
# pi_1100=seq(0, 1, by=.001)
ICA <- ICA.BinBin.Grid.Sample(pi1_1_=0.261, pi1_0_=0.285, 
pi_1_1=0.637, pi_1_0=0.078, pi0_1_=0.134, pi_0_1=0.127,  
Monotonicity=c("General"), M=2500, Seed=1)
           
# Plot the results (density of R2_H):
plot(ICA, Type="Density", R2_H=TRUE, R_H=FALSE, 
Theta_T=FALSE, Theta_S=FALSE)



