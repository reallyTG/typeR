library(robustbase)


### Name: vaso
### Title: Vaso Constriction Skin Data Set
### Aliases: vaso
### Keywords: datasets

### ** Examples

data(vaso)
str(vaso)
pairs(vaso)

glmV <- glm(Y ~ log(Volume) + log(Rate), family=binomial, data=vaso)
summary(glmV)
## -->  example(glmrob)  showing classical & robust GLM



