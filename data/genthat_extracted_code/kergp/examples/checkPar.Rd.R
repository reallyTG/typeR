library(kergp)


### Name: checkPar
### Title: Check Length and Names of a Vector of Values for Parameters or
###   Bounds
### Aliases: checkPar

### ** Examples

checkPar(value = c(1, 2), parN = 2L, parNames = c("theta", "sigma2"),
         default = 1.0)
checkPar(value = NULL, parN = 2L, parNames = c("theta", "sigma2"),
         default = 1.0)
checkPar(value = c("sigma2" = 100, "theta" = 1),
         parN = 2L, parNames = c("theta", "sigma2"),
         default = 1.0)




