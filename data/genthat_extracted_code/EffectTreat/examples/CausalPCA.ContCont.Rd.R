library(EffectTreat)


### Name: CausalPCA.ContCont
### Title: Show a causal diagram of the median correlation between the
###   counterfactuals in the continuous-continuous setting
### Aliases: CausalPCA.ContCont
### Keywords: Causal-Inference framework Continuous-continuous setting

### ** Examples

# Generate the vector of PCA.ContCont values when rho_T0S=.3, rho_T1S=.9, 
# sigma_T0T0=2, sigma_T1T1=2,sigma_SS=2, and the grid of values {-1, -.99, 
# ..., 1} is considered for the correlations between T0 and T1:
PCA <- PCA.ContCont(T0S=.3, T1S=.9, T0T0=2, T1T1=2, SS=2, 
T0T1=seq(-1, 1, by=.01))

# Obtain causal diagram for PCA score range [-1; 1]:
CausalPCA.ContCont(PCA,  Min=-1, Max=1)

# Obtain causal diagram for PCA score range [0.5; 1]:
CausalPCA.ContCont(PCA,  Min=0.5, Max=1)



