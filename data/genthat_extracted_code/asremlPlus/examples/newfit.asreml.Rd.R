library(asremlPlus)


### Name: newfit.asreml
### Title: Refits an asreml model with modified model formula using either
###   a call to 'update.asreml' or a direct call to 'asreml'.
### Aliases: newfit.asreml newfit
### Keywords: asreml

### ** Examples
## Not run: 
##D     m2.asreml <- newfit(m1.asreml, random. = "~ . - Blocks:Plots", maxiter=75)
## End(Not run)


