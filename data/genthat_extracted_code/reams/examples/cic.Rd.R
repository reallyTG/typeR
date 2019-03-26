library(reams)


### Name: cic
### Title: Covariance inflation criterion
### Aliases: cic

### ** Examples

data(swiss)
cicobj = cic(swiss$Fertility, swiss[ , -1])
cicobj$best



