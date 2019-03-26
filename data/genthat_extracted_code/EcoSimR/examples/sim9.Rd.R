library(EcoSimR)


### Name: sim9
### Title: Sim9 Co-occurrence Randomization Algorithm
### Aliases: sim9

### ** Examples

## Not run: 
##D 
##D ## Run the null model
##D finchMod <- cooc_null_model(dataWiFinches, algo="sim1",nReps=1000000,burn_in = 500)
##D ## Summary and plot info
##D summary(finchMod)
##D plot(finchMod,type="burn_in")
##D plot(finchMod,type="hist")
##D plot(finchMod,type="cooc")
## End(Not run)



