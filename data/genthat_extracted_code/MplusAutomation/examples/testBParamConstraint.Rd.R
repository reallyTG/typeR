library(MplusAutomation)


### Name: testBParamConstraint
### Title: Test inequality-constrained hypothesis for two parameters based
###   on iterations of MCMC chains
### Aliases: testBParamConstraint
### Keywords: interface

### ** Examples

## Not run: 
##D   #using bparameters directly
##D   btest <- getSavedata_Bparams("model vb1_simpel_b.out"))
##D   testBParametersConstraint(btest, "STDYX_STAITOT.ON.CG", ">", "STDYX_STAITOT.ON.UCG")
##D 
##D   #or using readModels
##D   btest <- readModels("model vb1_simpel_b.out"))
##D   testBParametersConstraint(btest, "STDYX_STAITOT.ON.CG", ">", "STDYX_STAITOT.ON.UCG")
## End(Not run)



