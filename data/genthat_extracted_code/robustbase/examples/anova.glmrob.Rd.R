library(robustbase)


### Name: anova.glmrob
### Title: Analysis of Robust Quasi-Deviance for "glmrob" Objects
### Aliases: anova.glmrob
### Keywords: robust models regression

### ** Examples

## Binomial response -----------
data(carrots)
Cfit2 <- glmrob(cbind(success, total-success) ~ logdose + block,
                family=binomial, data=carrots, method="Mqle",
                control=glmrobMqle.control(tcc=1.2))
summary(Cfit2)

Cfit4 <- glmrob(cbind(success, total-success) ~ logdose * block,
                family=binomial, data=carrots, method="Mqle",
                control=glmrobMqle.control(tcc=1.2))

anova(Cfit2, Cfit4, test="Wald")

anova(Cfit2, Cfit4, test="QD")

anova(Cfit2, Cfit4, test="QDapprox")

## Poisson response ------------
data(epilepsy)

Efit2 <- glmrob(Ysum ~ Age10 + Base4*Trt, family=poisson, data=epilepsy,
               method="Mqle", control=glmrobMqle.control(tcc=1.2,maxit=100))
summary(Efit2)

Efit3 <- glmrob(Ysum ~ Age10 + Base4 + Trt, family=poisson, data=epilepsy,
               method="Mqle", control=glmrobMqle.control(tcc=1.2,maxit=100))

anova(Efit3, Efit2, test = "Wald")

anova(Efit3, Efit2, test = "QD")

## trivial intercept-only-model:
E0 <- update(Efit3, . ~ 1)
anova(E0, Efit3, Efit2, test = "QDapprox")



