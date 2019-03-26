library(SpatioTemporal)


### Name: loglikeSTGrad
### Title: Compute Gradient and Hessian for the Log-likelihood
### Aliases: loglikeSTGrad loglikeSTHessian loglikeSTnaiveGrad
###   loglikeSTnaiveHessian

### ** Examples

## Not run: 
##D   ##load the data
##D   data(mesa.model)
##D   
##D   ##Compute dimensions for the data structure
##D   dim <- loglikeSTdim(mesa.model)
##D   
##D   ##Let's create random vectors of values
##D   x <- runif(dim$nparam.cov)
##D   x.all <- runif(dim$nparam)
##D  
##D   ##Compute the gradients
##D   Gf <- loglikeSTGrad(x.all, mesa.model, "f")
##D   Gp <- loglikeSTGrad(x, mesa.model, "p")
##D   Gr <- loglikeSTGrad(x, mesa.model, "r")
##D  
##D   ##And the Hessian, this may take some time...
##D   Hf <- loglikeSTHessian(x.all, mesa.model, "f")
##D   Hp <- loglikeSTHessian(x, mesa.model, "p")
##D   Hr <- loglikeSTHessian(x, mesa.model, "r")
## End(Not run)




