library(FAMT)


### Name: pi0FAMT
### Title: Estimation of the Proportion of True Null Hypotheses
### Aliases: pi0FAMT

### ** Examples

# Reading 'FAMTdata'
data(expression)
data(covariates)
data(annotations)
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)

# FAMT complete multiple testing procedure
model = modelFAMT(chicken,x=c(3,6),test=6,nbf=3)

# Estimation of the Proportion of True Null Hypotheses
# "density" method 
## Not run:  pi0FAMT(model,method="density",diagnostic.plot=TRUE)

# "smoother" method
pi0FAMT(model,method="smoother",diagnostic.plot=TRUE)




