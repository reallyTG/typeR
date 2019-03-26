library(mvst)


### Name: summary.mcSE
### Title: Summary function for mcSE objects.
### Aliases: summary.mcSE

### ** Examples

# Generate Normally distributed data
pars = list(xi=c(2,2), G=diag(2), psi=c(0.3,0.5), nu=5)
values = rmvSE(n=100, p=2, modelType='N', theta=pars)
# Estimate a Skew-t model (not run)
# fit = mcSE(y=values$y, X=NULL, N=20000, Ti=3, modelType='ST', warmUp=FALSE)
# summary(fit)



