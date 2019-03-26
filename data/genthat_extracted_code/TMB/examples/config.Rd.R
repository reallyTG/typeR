library(TMB)


### Name: config
### Title: Get or set internal configuration variables
### Aliases: config

### ** Examples

## Not run: 
##D ## Load library
##D dyn.load(dynlib("mymodel"))
##D ## Read the current settings
##D config(DLL="mymodel")
##D ## Reduce memory peak of a parallel model by creating tapes in serial
##D config(tape.parallel=0, DLL="mymodel")
##D obj <- MakeADFun(..., DLL="mymodel")
## End(Not run)



