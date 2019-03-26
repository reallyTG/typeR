library(FAMT)


### Name: defacto
### Title: FAMT factors description
### Aliases: defacto

### ** Examples

## FAMT data
data(expression)
data(covariates)
data(annotations)

# Create the 'FAMTdata'
############################################
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)
# 'FAMTdata' summary 
## Not run: summaryFAMT(chicken)

# FAMT complete multiple testing procedure
############################################
model = modelFAMT(chicken,x=c(3,6),test=6,nbf=3)
# summary on the 'FAMT model'
## Not run: summaryFAMT(model)

# Factors description
############################################
chicken.defacto = defacto(model,axes=1:2,select.covar=4:5,select.annot=3:6,
cex=0.6)



