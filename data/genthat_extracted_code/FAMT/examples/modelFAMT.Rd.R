library(FAMT)


### Name: modelFAMT
### Title: The FAMT complete multiple testing procedure
### Aliases: modelFAMT

### ** Examples

## Reading 'FAMTdata'
data(expression)
data(covariates)
data(annotations)

chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)

# Classical method with modelFAMT 
## Not run: modelpval=modelFAMT(chicken,x=c(3,6),test=6,nbf=0)
## Not run: summaryFAMT(modelpval)

# FAMT complete multiple testing procedure
# when the optimal number of factors is unknown
## Not run: 
##D model = modelFAMT(chicken,x=c(3,6),test=6)
##D 
##D # when the optimal number of factors has already been estimated 
##D  model = modelFAMT(chicken,x=c(3,6),test=6,nbf=3)
##D 
##D summaryFAMT(model)
##D hist(model$adjpval)
## End(Not run)



