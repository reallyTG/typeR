library(meta4diag)


### Name: makeData
### Title: Make internally used data structure.
### Aliases: makeData

### ** Examples

## Not run: 
##D data(Catheter)
##D 
##D a = makeData(data=Catheter,model.type=1,modality="type")
##D b = makeData(data=Catheter,model.type=1,modality=2)
##D c = makeData(data=Catheter,model.type=1,covariates="prevalence")
##D d = makeData(data=Catheter,model.type=1,covariates=3)
##D e = makeData(data=Catheter,model.type=1,modality="type",covariates="prevalence")
## End(Not run)



