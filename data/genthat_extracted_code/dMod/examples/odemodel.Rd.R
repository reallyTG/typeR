library(dMod)


### Name: odemodel
### Title: Generate the model objects for use in Xs (models with
###   sensitivities)
### Aliases: odemodel

### ** Examples

## Not run: 
##D 
##D ## Generate a compiled ODE model from an equation vector
##D ## The model will not return sensitivities for "switch"
##D ## Files will be generated in your working directory!
##D 
##D f <- eqnvec(A = "-k*A + switch*F")
##D model <- odemodel(f, forcings = "F", fixed = "switch")
##D print(model)
##D 
##D ## Generate the same model from an equation list
##D f <- addReaction(NULL, from = "", to = "A", rate = "switch*F", description = "production")
##D f <- addReaction(f   , from = "A", to = "", rate = "k*A", description = "degradation")
##D print(f)
##D 
##D model <- odemodel(f, forcings = "F", fixed = "switch")
##D print(model)
##D 
## End(Not run)



