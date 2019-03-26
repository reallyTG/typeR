library(EcoSimR)


### Name: reproduce_model
### Title: Reproduce a result
### Aliases: reproduce_model

### ** Examples

## Not run: 
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim1",saveSeed=T)
##D ## Check model output
##D mean(finchMod$Sim)
##D 
##D reproduce_model(finchMod)
##D 
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim1")
##D ## Check model output is the same as before
##D mean(finchMod$Sim)
##D reproduce_model(finchMod)
## End(Not run)



