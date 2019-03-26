library(EffectTreat)


### Name: Predict.Treat.ContCont
### Title: Compute the predicted treatment effect on the true endpoint of a
###   patient based on his or her observed pretreatment predictor value in
###   the continuous-continuous setting
### Aliases: Predict.Treat.ContCont
### Keywords: Causal-Inference framework Continuous-continuous setting

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

# plot Delta_T_j given S_T, for the mean value of the valid rho_T0T1  
plot(Predict, Mean.T0T1=TRUE, Median.T0T1=FALSE)



