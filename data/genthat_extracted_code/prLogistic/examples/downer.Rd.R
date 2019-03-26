library(prLogistic)


### Name: downer
### Title: Downer Data
### Aliases: downer
### Keywords: datasets

### ** Examples

data("downer", package = "prLogistic")
attach(downer)
# prop.table(table(Survival))
fit.logist1=glm(Survival ~ Calving + CK + AST + Myopathy, 
family=binomial, data=downer)
# summary(fit.logist1)
exp(fit.logist1$coef)



