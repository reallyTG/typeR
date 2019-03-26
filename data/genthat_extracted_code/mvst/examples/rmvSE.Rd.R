library(mvst)


### Name: rmvSE
### Title: Random generation from a SE distribution.
### Aliases: rmvSE

### ** Examples

## Generate artificial data
pars = list(xi=c(3,5), psi=c(2,4), G=diag(2), nu=6)
values = rmvSE(n=200, p=2, modelType='ST', theta=pars)
## X contains the data matrix and the vectors z and v of latent variables:
y = values$y
z = values$z
v = values$v



