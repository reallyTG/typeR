library(mvst)


### Name: dmvSE
### Title: Density function for the SE distributions.
### Aliases: dmvSE

### ** Examples

# Define the parameters' list
pars = list(xi=c(5,2), G=diag(2), psi=rep(1,2), nu=4)
# Generate data
value = rmvSE(1, 2, NULL, 'ST', theta=pars)
# Compute the density function in the point y
dmvSE(y=value$y, X=NULL, modelType='ST', theta=pars, LOG=FALSE)



