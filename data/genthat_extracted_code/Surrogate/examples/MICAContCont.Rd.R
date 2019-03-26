library(Surrogate)


### Name: MICA.ContCont
### Title: Assess surrogacy in the causal-inference multiple-trial setting
###   (Meta-analytic Individual Causal Association; MICA) in the
###   continuous-continuous case
### Aliases: MICA.ContCont
### Keywords: Causal-Inference framework Counterfactuals Multiple-trial
###   setting Sensitivity ICA MICA

### ** Examples

## Not run: 
##D  #time-consuming code parts
##D # Generate the vector of MICA values when R_trial=.8, rho_T0S0=rho_T1S1=.8,
##D # sigma_T0T0=90, sigma_T1T1=100,sigma_ S0S0=10, sigma_S1S1=15, D.aa=5, D.bb=10,  
##D # and when the grid of values {0, .2, ..., 1} is considered for the 
##D # correlations between the counterfactuals:
##D SurMICA <- MICA.ContCont(Trial.R=.80, D.aa=5, D.bb=10, T0S0=.8, T1S1=.8,
##D T0T0=90, T1T1=100, S0S0=10, S1S1=15, T0T1=seq(0, 1, by=.2), 
##D T0S1=seq(0, 1, by=.2), T1S0=seq(0, 1, by=.2), S0S1=seq(0, 1, by=.2))
##D 
##D # Examine and plot the vector of the generated MICA values:
##D summary(SurMICA)
##D plot(SurMICA)
##D 
##D 
##D # Same analysis, but now assume that D.aa=.5 and D.bb=.1:
##D SurMICA <- MICA.ContCont(Trial.R=.80, D.aa=.5, D.bb=.1, T0S0=.8, T1S1=.8,
##D T0T0=90, T1T1=100, S0S0=10, S1S1=15, T0T1=seq(0, 1, by=.2), 
##D T0S1=seq(0, 1, by=.2), T1S0=seq(0, 1, by=.2), S0S1=seq(0, 1, by=.2))
##D 
##D # Examine and plot the vector of the generated MICA values:
##D summary(SurMICA)
##D plot(SurMICA)
##D 
##D 
##D # Same as first analysis, but specify vectors for rho_T0S0 and rho_T1S1: 
##D # Sample from normal with mean .8 and SD=.1 (to account for uncertainty 
##D # in estimation) 
##D SurMICA <- MICA.ContCont(Trial.R=.80, D.aa=5, D.bb=10, 
##D T0S0=rnorm(n=10000000, mean=.8, sd=.1), 
##D T1S1=rnorm(n=10000000, mean=.8, sd=.1),
##D T0T0=90, T1T1=100, S0S0=10, S1S1=15, T0T1=seq(0, 1, by=.2), 
##D T0S1=seq(0, 1, by=.2), T1S0=seq(0, 1, by=.2), S0S1=seq(0, 1, by=.2))
## End(Not run)



