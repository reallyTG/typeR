library(meta4diag)


### Name: makeObject
### Title: A function used to make a 'meta4diag' object.
### Aliases: makeObject

### ** Examples

## Not run: 
##D if(requireNamespace("INLA", quietly = TRUE)){
##D   require("INLA", quietly = TRUE)
##D   data(Catheter)
##D   outdata = makeData(Catheter)
##D   outpriors = makePriors()
##D   model = runModel(outdata=outdata, outpriors=outpriors, link="logit")
##D   res = makeObject(outdata, outpriors, model, nsample=2000)
##D }
## End(Not run)



