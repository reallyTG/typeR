library(BinaryEPPM)


### Name: LL.gradient
### Title: Function used to calculate the first derivatives of the log
###   likelihood with respect to the model parameters.
### Aliases: LL.gradient
### Keywords: model

### ** Examples

## Not run: 
##D     gradient <- grad(LL.Regression.Binary, x = parameter, model.type = model.type,
##D         model.name = model.name, link = link, ntrials = ntrials, nsuccess = nsuccess,
##D         covariates.matrix.p = covariates.matrix.p,
##D         covariates.matrix.scalef = covariates.matrix.scalef, 
##D         offset.p = offset.p, offset.scalef = offset.scalef, weights = weights,
##D         grad.method = "Richardson")
##D     return(gradient)
##D   
## End(Not run)



