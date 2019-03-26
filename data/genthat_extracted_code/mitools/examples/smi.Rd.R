library(mitools)


### Name: smi
### Title: Multiple imputations
### Aliases: smi
### Keywords: datasets

### ** Examples

data(smi)
with(smi, table(sex, drkfre))
model1<-with(smi, glm(drinkreg~wave*sex, family=binomial()))
MIcombine(model1)
summary(MIcombine(model1))



