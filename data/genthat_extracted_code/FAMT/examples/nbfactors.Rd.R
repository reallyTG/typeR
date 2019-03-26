library(FAMT)


### Name: nbfactors
### Title: Estimation of the optimal number of factors of the FA model
### Aliases: nbfactors

### ** Examples
 
## Reading 'FAMTdata'
data(expression)
data(covariates)
data(annotations)
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)

# Estimation of the number of factors 
## Not run: nbfactors(chicken,x=c(3,6),test=6)

# Estimation of the number of factors with a graph of variance inflation 
# criterion
## Not run: nbfactors(chicken,x=c(3,6),test=6, diagnostic.plot=TRUE)




