library(sybil)


### Name: sysBiolAlg
### Title: General Constructor Function For Objects of Class 'sysBiolAlg'
### Aliases: sysBiolAlg
### Keywords: classes

### ** Examples

## Not run: 
##D ## The examples here require the package glpkAPI to be
##D ## installed. If that package is not available, you have to set
##D ## the argument 'solver' (the default is: solver = SYBIL_SETTINGS("SOLVER")).
##D 
##D data(Ec_core)
##D 
##D ## algorithm: fba (flux balance analysis)
##D fb <- sysBiolAlg(Ec_core, algorithm = "fba")
##D 
##D ## algorithm: lmoma (linearized version of MOMA)
##D fb <- sysBiolAlg(Ec_core, algorithm = "lmoma")
## End(Not run)



