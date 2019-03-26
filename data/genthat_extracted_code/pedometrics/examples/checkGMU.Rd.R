library(pedometrics)


### Name: checkGMU
### Title: Evaluation of geostatistical models of uncertainty
### Aliases: checkGMU

### ** Examples

## Not run: 
##D set.seed(2001)
##D observed <- round(rnorm(100), 3)
##D simulated <- t(
##D   sapply(1:length(observed), function (i) round(rnorm(100), 3)))
##D resa <- checkGMU(observed, simulated, symmetric = T)
##D resb <- checkGMU(observed, simulated, symmetric = F)
##D resa$error;resb$error
##D resa$goodness;resb$goodness
## End(Not run)



