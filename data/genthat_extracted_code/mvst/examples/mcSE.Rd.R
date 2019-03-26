library(mvst)


### Name: mcSE
### Title: MC sampler for a p-variate Skew-Elliptical model.
### Aliases: mcSE

### ** Examples

## Generate artificial data
pars = list(xi=c(3,5), psi=c(2,4), G=diag(2), nu=6)
values = rmvSE(n=60, p=2, modelType='ST', theta=pars)
## Estimate a Skew-t model (not run)
# fit = mcSE(y=values$y, N=20000, Ti=3, modelType='ST')
# stats = summary(fit)
# coef(stats)



