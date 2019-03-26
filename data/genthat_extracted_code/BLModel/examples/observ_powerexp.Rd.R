library(BLModel)


### Name: observ_powerexp
### Title: Example of distribution of views - power exponential
###   distribution
### Aliases: observ_powerexp

### ** Examples

k =3
observ_powerexp (x = matrix(c(rep(0.5,k),rep(0.2,k)),k,2), q = matrix(0,k,1),
               covmat = diag(k), beta = 0.6)




