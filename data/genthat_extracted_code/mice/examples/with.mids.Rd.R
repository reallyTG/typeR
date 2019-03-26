library(mice)


### Name: with.mids
### Title: Evaluate an expression in multiple imputed datasets
### Aliases: with.mids
### Keywords: multivariate

### ** Examples



imp <- mice(nhanes2)
fit1 <- with(data=imp,exp=lm(bmi~age+hyp+chl))
fit2 <- with(data=imp,exp=glm(hyp~age+bmi+chl,family=binomial))
anova.imp <- with(data=imp,exp=anova(lm(bmi~age+hyp+chl)))



