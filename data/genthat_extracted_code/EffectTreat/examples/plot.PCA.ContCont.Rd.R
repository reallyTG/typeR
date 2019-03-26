library(EffectTreat)


### Name: plot PCA.ContCont
### Title: Plots the Predictive Causal Association in the
###   continuous-continuous case
### Aliases: 'plot PCA.ContCont' plot.PCA.ContCont
###   plot.Multivar.PCA.ContCont
### Keywords: Plot PCA Causal-Inference framework Sensitivity Plausibility
###   of a good pretreatment predictor Continuous-continuous setting
###   Multivariate predictors Univariate predictors

### ** Examples

# Generate the vector of PCA.ContCont values when rho_T0S=.3, rho_T1S=.9, 
# sigma_T0T0=2, sigma_T1T1=2,sigma_SS=2, and  
# the grid of values {-1, -.99, ..., 1} is considered for the correlations
# between T0 and T1:
PCA <- PCA.ContCont(T0S=.3, T1S=.9, T0T0=2, T1T1=2, SS=2, 
T0T1=seq(-1, 1, by=.01))

# Plot the results:
plot(PCA)

# Same plot but add the percentages of PCA values that are equal to or larger 
# than the midpoint values of the bins
plot(PCA, Labels=TRUE)

# Plot of the cumulative distribution of PCA
plot(PCA, Typ="CumPerc")



