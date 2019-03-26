library(mvst)


### Name: cmlSE
### Title: CML for the parameters of a p-variate Skew-Elliptical model.
### Aliases: cmlSE

### ** Examples

## Generate artificial data
pars = list(xi=c(3,5), psi=c(2,4), G=diag(2), nu=6)
values = rmvSE(n=20, p=2, modelType='ST', theta=pars)
## CML estimates for pars
thetaHat = cmlSE(modelType='ST', y=values$y, z=values$z, v=values$v)



