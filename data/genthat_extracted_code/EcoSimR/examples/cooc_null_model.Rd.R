library(EcoSimR)


### Name: cooc_null_model
### Title: Co-Occurrence Null model
### Aliases: cooc_null_model

### ** Examples

## Not run: 
##D 
##D ## Run the null model
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim9",nReps=10000,burn_in = 500)
##D ## Summary and plot info
##D summary(finchMod)
##D plot(finchMod,type="burn_in")
##D plot(finchMod,type="hist")
##D plot(finchMod,type="cooc")
##D 
##D ## Example that is repeatable with a saved seed
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim1",saveSeed = TRUE)
##D mean(finchMod$Sim)
##D ## Run the model with the seed saved
##D 
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim1",saveSeed=T)
##D ## Check model output
##D mean(finchMod$Sim)
##D 
##D reproduce_model(finchMod$Sim)
##D 
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim1")
##D ## Check model output is the same as before
##D mean(finchMod$Sim)
##D reproduce_model(finchMod$Sim)
##D 
##D 
## End(Not run)



