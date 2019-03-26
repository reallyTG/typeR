library(BAS)


### Name: coef.bas
### Title: Coefficients of a Bayesian Model Average object
### Aliases: coef.bas coef coefficients coefficients.bas print.coef.bas
### Keywords: regression

### ** Examples


data("Hald")
hald.gprior =  bas.lm(Y~ ., data=Hald, n.models=2^4, alpha=13,
                      prior="ZS-null", initprobs="Uniform", update=10)
coef.hald.gprior = coefficients(hald.gprior)
coef.hald.gprior
plot(coef.hald.gprior)
confint(coef.hald.gprior)

#Estimation under Median Probability Model
coef.hald.gprior = coefficients(hald.gprior, estimator="MPM")
coef.hald.gprior
plot(coef.hald.gprior)
plot(confint(coef.hald.gprior))


coef.hald.gprior = coefficients(hald.gprior, estimator="HPM")
coef.hald.gprior
plot(coef.hald.gprior)
confint(coef.hald.gprior)

# To add estimation under Best Predictive Model





