library(Surrogate)


### Name: ICA.ContCont
### Title: Assess surrogacy in the causal-inference single-trial setting
###   (Individual Causal Association, ICA) in the Continuous-continuous
###   case
### Aliases: ICA.ContCont
### Keywords: Causal-Inference framework Counterfactuals Single-trial
###   setting Sensitivity ICA

### ** Examples

## Not run: 
##D  #time-consuming code parts
##D # Generate the vector of ICA.ContCont values when rho_T0S0=rho_T1S1=.95, 
##D # sigma_T0T0=90, sigma_T1T1=100,sigma_ S0S0=10, sigma_S1S1=15, and  
##D # the grid of values {0, .2, ..., 1} is considered for the correlations
##D # between the counterfactuals:
##D SurICA <- ICA.ContCont(T0S0=.95, T1S1=.95, T0T0=90, T1T1=100, S0S0=10, S1S1=15,
##D T0T1=seq(0, 1, by=.2), T0S1=seq(0, 1, by=.2), T1S0=seq(0, 1, by=.2), 
##D S0S1=seq(0, 1, by=.2))
##D 
##D # Examine and plot the vector of generated ICA values:
##D summary(SurICA)
##D plot(SurICA)
##D 
##D # Obtain the positive definite matrices than can be formed as based on the 
##D # specified (vectors) of the correlations (these matrices are used to 
##D # compute the ICA values)
##D SurICA$Pos.Def
##D 
##D # Same, but specify vectors for rho_T0S0 and rho_T1S1: Sample from
##D # normal with mean .95 and SD=.05 (to account for uncertainty 
##D # in estimation) 
##D SurICA2 <- ICA.ContCont(T0S0=rnorm(n=10000000, mean=.95, sd=.05), 
##D T1S1=rnorm(n=10000000, mean=.95, sd=.05), 
##D T0T0=90, T1T1=100, S0S0=10, S1S1=15,
##D T0T1=seq(0, 1, by=.2), T0S1=seq(0, 1, by=.2), T1S0=seq(0, 1, by=.2), 
##D S0S1=seq(0, 1, by=.2))
##D 
##D # Examine results
##D summary(SurICA2)
##D plot(SurICA2)
## End(Not run)



