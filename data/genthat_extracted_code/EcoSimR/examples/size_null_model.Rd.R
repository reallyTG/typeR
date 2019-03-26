library(EcoSimR)


### Name: size_null_model
### Title: Size Ratio
### Aliases: size_null_model

### ** Examples

## Not run: 
##D ## Run the null model
##D rodentMod <- size_null_model(dataRodents)
##D ## Summary and plot info
##D summary(rodentMod)
##D plot(rodentMod,type="hist")
##D plot(rodentMod,type="size")
##D 
##D ##  Uniform Size model with user inputs
##D rodentMod2 <- size_null_model(dataRodents,algo="size_uniform_user",
##D algoOpts = list(userLow = 3,userHigh=15))
##D summary(rodentMod2)
##D plot(rodentMod2,type="hist")
##D plot(rodentMod2,type="size")
##D 
##D ### Source pool model
##D 
##D rodentMod_sp <- size_null_model(dataRodents,algo="size_source_pool",
##D algoOpts = list(sourcePool = runif(dim(dataRodents)[1],1,15)))
##D 
##D summary(rodentMod_sp)
##D plot(rodentMod_sp,type="hist")
##D plot(rodentMod_sp,type="size")
##D 
## End(Not run)



