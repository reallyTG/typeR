library(survival)


### Name: model.matrix.coxph
### Title: Model.matrix method for coxph models
### Aliases: model.matrix.coxph
### Keywords: survival

### ** Examples

fit1 <- coxph(Surv(time, status) ~ age + factor(ph.ecog), data=lung)
xfit <- model.matrix(fit1)

fit2 <- coxph(Surv(time, status) ~ age + factor(ph.ecog), data=lung,
                                 x=TRUE)
all.equal(model.matrix(fit1), fit2$x)



