library(FAMT)


### Name: summaryFAMT
### Title: Summary of a FAMTdata or a FAMTmodel
### Aliases: summaryFAMT

### ** Examples

## Reading 'FAMTdata'
data(expression)
data(covariates)
data(annotations)
chicken = as.FAMTdata(expression,covariates,annotations,idcovar=2)

## Summary of a 'FAMTdata'
#############################################
summaryFAMT(chicken)

## Summary of a 'FAMTmodel'
#############################################
# FAMT complete multiple testing procedure 
model = modelFAMT(chicken,x=c(3,6),test=6,nbf=3)
summaryFAMT(model)



