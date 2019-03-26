library(CountsEPPM)


### Name: LL.gradient
### Title: Function used to calculate the first derivatives of the log
###   likelihood with respect to the model parameters.
### Aliases: LL.gradient
### Keywords: model

### ** Examples

## Not run: 
##D gradient <- grad( LL.Regression.Binary, x = parameter,
##D  model.type = model.type, model.name = model.name, link = link,
##D  ntrials = ntrials, nsuccess = nsuccess,
##D  covariates.matrix.mean = covariates.matrix.mean, 
##D  covariates.matrix.scalef = covariates.matrix.scalef,
##D  offset.mean = offset.mean, offset.scalef = offset.scalef,
##D  weights = weights, grad.method = "Richardson")
##D  return(gradient)
##D   
## End(Not run)



