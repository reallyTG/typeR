library(Surrogate)


### Name: plot Causal-Inference ContCont
### Title: Plots the (Meta-Analytic) Individual Causal Association when S
###   and T are continuous outcomes
### Aliases: 'plot Causal-Inference ContCont' plot.ICA.ContCont
###   plot.MICA.ContCont
### Keywords: Plot surrogacy Causal-Inference framework Single-trial
###   setting Multiple-trial setting Sensitivity Plausibility of a
###   surrogate

### ** Examples

# Plot of ICA

# Generate the vector of ICA values when rho_T0S0=rho_T1S1=.95, and when the
# grid of values {0, .2, ..., 1} is considered for the correlations
# between the counterfactuals:
SurICA <- ICA.ContCont(T0S0=.95, T1S1=.95, T0T1=seq(0, 1, by=.2), T0S1=seq(0, 1, by=.2), 
T1S0=seq(0, 1, by=.2), S0S1=seq(0, 1, by=.2))

# Plot the results:
plot(SurICA)

# Same plot but add the percentages of ICA values that are equal to or larger 
# than the midpoint values of the bins
plot(SurICA, Labels=TRUE)

# Plot of both ICA and MICA

# Generate the vector of ICA and MICA values when R_trial=.8, rho_T0S0=rho_T1S1=.8, 
# D.aa=5, D.bb=10, and when the grid of values {0, .2, ..., 1} is considered 
# for the correlations between the counterfactuals:
SurMICA <- MICA.ContCont(Trial.R=.80, D.aa=5, D.bb=10, T0S0=.8, T1S1=.8, 
T0T1=seq(0, 1, by=.2), T0S1=seq(0, 1, by=.2), T1S0=seq(0, 1, by=.2), 
S0S1=seq(0, 1, by=.2))

# Plot the vector of generated ICA and MICA values
plot(SurMICA, ICA=TRUE, MICA=TRUE)



