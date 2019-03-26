library(bayesDccGarch)


### Name: logLikDccGarch
### Title: The logarithm of likelihood function of DCC-GARCH(1,1) Model.
### Aliases: logLikDccGarch
### Keywords: GARCH DCC-GARCH

### ** Examples


data(DaxCacNik)

Dax = DaxCacNik[,1]

######  log-likelihood function of GARCH(1,1) model with SST innovations ####
logLikDccGarch(Dax, omega=0.03, alpha=0.03, beta=0.8, gamma=0.7)$value

######  log-likelihood function of DCC-GARCH(1,1) model with SST innovations ####
logLikDccGarch(DaxCacNik, beta=c(0.82,0.91,0.85), gamma=c(0.7, 1.3, 1.7), tail=10)$value




