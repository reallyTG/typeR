library(Surrogate)


### Name: ICA.Sample.ContCont
### Title: Assess surrogacy in the causal-inference single-trial setting
###   (Individual Causal Association, ICA) in the Continuous-continuous
###   case using the grid-based sample approach
### Aliases: ICA.Sample.ContCont
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA

### ** Examples

# Generate the vector of ICA values when rho_T0S0=rho_T1S1=.95, 
# sigma_T0T0=90, sigma_T1T1=100,sigma_ S0S0=10, sigma_S1S1=15, and  
# min=-1 max=1 is considered for the correlations
# between the counterfactuals:
SurICA2 <- ICA.Sample.ContCont(T0S0=.95, T1S1=.95, T0T0=90, T1T1=100, S0S0=10, 
S1S1=15, M=5000)

# Examine and plot the vector of generated ICA values:
summary(SurICA2)
plot(SurICA2)



