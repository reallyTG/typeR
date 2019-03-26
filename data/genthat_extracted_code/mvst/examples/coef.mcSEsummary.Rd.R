library(mvst)


### Name: coef.mcSEsummary
### Title: Extract mcSE Model Coefficients.
### Aliases: coef.mcSEsummary

### ** Examples

# Generate ST-distributed data (including the value of the latent variables)
pars = list(xi=c(2,2), G=diag(2), psi=c(0.3,0.5), nu=5)
values = rmvSE(n=100, p=2, modelType='ST', theta=pars)
# Estimate a Skew-t model (not run)
# fit = mcSE(y=values$y, X=NULL, N=20000, Ti=3, modelType='ST', warmUp=TRUE)
# stats = summary(fit)
# coef(stats)



