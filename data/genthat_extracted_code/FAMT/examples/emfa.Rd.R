library(FAMT)


### Name: emfa
### Title: Factor Analysis model adjustment with the EM algorithm
### Aliases: emfa

### ** Examples

## Reading 'FAMTdata'
data(expression)
data(covariates)
data(annotations)
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)

# EM fitting of the Factor Analysis model
chicken.emfa = emfa(chicken,nbf=3,x=c(3,6),test=6)
chicken.emfa$commonvar



