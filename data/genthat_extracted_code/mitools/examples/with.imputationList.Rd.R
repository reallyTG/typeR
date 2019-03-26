library(mitools)


### Name: with.imputationList
### Title: Evaluate an expression in multiple imputed datasets
### Aliases: with.imputationList
### Keywords: manip

### ** Examples

data(smi)
models<-with(smi, glm(drinkreg~wave*sex,family=binomial()))
tables<-with(smi, table(drkfre,sex))
with(smi, fun=summary)



