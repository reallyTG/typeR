library(Surrogate)


### Name: Sim.Data.Counterfactuals
### Title: Simulate a dataset that contains counterfactuals
### Aliases: Sim.Data.Counterfactuals
### Keywords: Causal-Inference framework Simulate data Counterfactuals

### ** Examples

## Generate a dataset with 2000 patients, cor(S0,T0)=cor(S1,T1)=.5, 
## cor(T0,T1)=cor(T0,S1)=cor(T1,S0)=cor(S0,S1)=0, with means 
## 5, 9, 12, and 15 for S0, S1, T0, and T1, respectively:
Sim.Data.Counterfactuals(N=2000, T0S0=.5, T1S1=.5, T0T1=0, T0S1=0, T1S0=0, S0S1=0, 
mu_c=c(5, 9, 12, 15), Seed=1)



