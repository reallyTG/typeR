library(EffectTreat)


### Name: plot.Predict.Treat.ContCont
### Title: Plots the distribution of the individual causal effect based on
###   S.
### Aliases: 'plot Predict.Treat.ContCont' plot.Predict.Treat.ContCont
###   plot.Predict.Treat.Multivar.ContCont
### Keywords: Causal-Inference framework Continuous-continuous setting Plot

### ** Examples

# Generate the vector of PCA.ContCont values when rho_T0S=.3, rho_T1S=.9, 
# sigma_T0T0=2, sigma_T1T1=2,sigma_SS=2, and the grid of values {-1, -.99, 
# ..., 1} is considered for the correlations between T0 and T1:
PCA <- PCA.ContCont(T0S=.3, T1S=.9, T0T0=2, T1T1=2, SS=2, 
T0T1=seq(-1, 1, by=.01))

# Obtain the predicted value T for a patient who scores S = 10, using beta=5,
# SS=2, mu_S=4
Predict <- Predict.Treat.ContCont(x=PCA, S=10, Beta=5, SS=2, mu_S=4)

# examine the results
summary(Predict)

# plot Delta_T_j given S_T and 95% CI  based on 
# the mean value of the valid rho_T0T1 results  
plot(Predict, Mean.T0T1=TRUE, Median.T0T1=FALSE, 
xlim=c(4, 13))

# plot Delta_T_j given S_T and 99% CI  using 
#  rho_T0T1=.8   
plot(Predict, Mean.T0T1=FALSE, Median.T0T1=FALSE, 
Specific.T0T1=.6, alpha=0.01, xlim=c(4, 13))



