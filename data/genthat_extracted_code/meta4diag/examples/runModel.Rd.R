library(meta4diag)


### Name: runModel
### Title: Run the bivariate model.
### Aliases: runModel

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)) {
##D    require("INLA", quietly = TRUE)
##D    data(Catheter)
##D 
##D    outdata = makeData(data=Catheter,model.type=1,covariates="type")
##D    outpriors = makePriors(var.prior = "invgamma", cor.prior = "normal", 
##D                           var.par = c(0.25, 0.025), cor.par = c(0, 5))
##D    runModel(outdata, outpriors, link = "logit", 
##D             quantiles = c(0.025, 0.5, 0.975), verbose = FALSE)
##D }
## End(Not run)



