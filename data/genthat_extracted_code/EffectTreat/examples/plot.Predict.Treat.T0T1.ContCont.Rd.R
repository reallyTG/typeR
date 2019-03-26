library(EffectTreat)


### Name: plot.Predict.Treat.T0T1.ContCont
### Title: Plots the distribution of the individual causal effect based on
###   S for a specific assumed correlation between the counterfactuals.
### Aliases: 'plot Predict.Treat.T0T1.ContCont'
###   plot.Predict.Treat.T0T1.ContCont
### Keywords: Causal-Inference framework Continuous-continuous setting Plot

### ** Examples

# Generate the vector of PCA.ContCont values when rho_T0S=.3, rho_T1S=.9, 
# sigma_T0T0=2, sigma_T1T1=2,sigma_SS=2, and the grid of values {-1, -.99, 
# ..., 1} is considered for the correlations between T0 and T1:
PCA <- PCA.ContCont(T0S=.3, T1S=.9, T0T0=2, T1T1=2, SS=2, 
T0T1=seq(-1, 1, by=.01))

# Obtain the predicted value T for a patient who scores S = 10, using beta=5,
# SS=2, mu_S=4, assuming rho_T0T1=.6
indiv <- Predict.Treat.T0T1.ContCont(x=PCA, S=10, Beta=5, SS=2, mu_S=4, T0T1=.6)
summary(indiv)

# obtain a plot with the 95% CI around delta T_j | S_j (assuming rho_T0T1=.6)
plot(indiv, xlim=c(5, 12))



