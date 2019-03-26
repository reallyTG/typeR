library(glmmBUGS)


### Name: writeBugsModel
### Title: Write a bugs model file for a Generalised Linear Mixed Model
### Aliases: writeBugsModel

### ** Examples

writeBugsModel("model.bug", effects="Strip",  observations="conc",
  covariates=list(observations="length"),
  family="normal", priors=c(intercept="dunif(-10,10)") )

cat(scan("model.bug", "a",sep='\n'),sep='\n')




