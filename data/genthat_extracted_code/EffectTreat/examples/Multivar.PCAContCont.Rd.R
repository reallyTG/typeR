library(EffectTreat)


### Name: Multivar.PCA.ContCont
### Title: Compute the multivariate predictive causal association (PCA) in
###   the Continuous-continuous case
### Aliases: Multivar.PCA.ContCont
### Keywords: Causal-Inference framework Sensitivity PCA
###   Continuous-continuous setting Multivariate setting

### ** Examples

# First specify the covariance matrices to be used 
Sigma_TT = matrix(c(177.870, NA, NA, 162.374), byrow=TRUE, nrow=2)
Sigma_TS = matrix(data = c(-45.140, -109.599, 11.290, -56.542,
-106.897, 20.490), byrow = TRUE, nrow = 2)
Sigma_SS = matrix(data=c(840.564, 73.936, -3.333, 73.936, 357.719,
-30.564, -3.333, -30.564, 95.063), byrow = TRUE, nrow = 3)

# Compute PCA
Results <- Multivar.PCA.ContCont(Sigma_TT = Sigma_TT,
Sigma_TS = Sigma_TS, Sigma_SS = Sigma_SS)

# Evaluate results
summary(Results)
plot(Results)



