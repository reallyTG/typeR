library(EffectTreat)


### Name: Min.Max.Multivar.PCA
### Title: Minimum and maximum values for the multivariate predictive
###   causal association (PCA) in the continuous-continuous case
### Aliases: Min.Max.Multivar.PCA
### Keywords: min, max PCA Continuous-continuous setting Multivariate
###   setting

### ** Examples

# Specify vector of S by treatment interaction coefficients 
gamma <- matrix(data = c(-0.006, -0.002, 0.045), ncol=1)
# Specify variances
Sigma_SS = matrix(data=c(882.352, 49.234, 6.420,
49.234, 411.964, -26.205, 6.420, -26.205, 95.400),
byrow = TRUE, nrow = 3)
Sigma_T0T0 <- 82.274
Sigma_T1T1 <- 96.386

# Compute min and max PCA
Min.Max.Multivar.PCA(gamma=gamma, Sigma_SS=Sigma_SS, 
Sigma_T0T0=Sigma_T0T0, Sigma_T1T1=Sigma_T1T1)



