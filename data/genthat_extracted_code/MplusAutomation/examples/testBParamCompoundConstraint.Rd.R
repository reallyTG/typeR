library(MplusAutomation)


### Name: testBParamCompoundConstraint
### Title: Test inequality-constrained hypothesis for two or more
###   parameters based on iterations of MCMC chains
### Aliases: testBParamCompoundConstraint
### Keywords: interface

### ** Examples

## Not run: 
##D   #using bparameters directly
##D   btest <- getSavedata_Bparams("model vb1_simpel_b.out")
##D   testBParametersCompoundConstraint(btest,
##D   "(STDYX_STAITOT.ON.CG > STDYX_STAITOT.ON.UCG) & (STDYX_BDIM.ON.CG > STDYX_BDIM.ON.UCG)")
##D 
##D   #or using readModels
##D   btest <- readModels("model vb1_simpel_b.out")
##D   testBParametersCompoundConstraint(btest,
##D   "(STDYX_STAITOT.ON.CG > STDYX_STAITOT.ON.UCG) & (STDYX_BDIM.ON.CG > STDYX_BDIM.ON.UCG)")
## End(Not run)



