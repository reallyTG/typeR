### R code from vignette source 'glmpathcr.Rnw'

###################################################
### code chunk number 1: glmpathcr.Rnw:75-83
###################################################
library(glmpathcr)
data(diabetes)
dim(diabetes)
names(diabetes)[1:10]
summary(diabetes$y)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmpathcr(x,y)


###################################################
### code chunk number 2: glmpathcr.Rnw:86-88
###################################################
summary(fit)
plot(fit, xvar = "step", type = "bic")


###################################################
### code chunk number 3: glmpathcr.Rnw:92-93
###################################################
plot(fit, xvar = "step", type = "bic")


###################################################
### code chunk number 4: glmpathcr.Rnw:99-103
###################################################
BIC.step <- model.select(fit)
BIC.step
AIC.step <- model.select(fit)
AIC.step


###################################################
### code chunk number 5: glmpathcr.Rnw:108-111
###################################################
coefficients<-coef(fit, s=BIC.step)
sum(coefficients!=0)
nonzero.coef(fit, s=BIC.step)


###################################################
### code chunk number 6: glmpathcr.Rnw:116-120
###################################################
pred <- predict(fit)
table(pred, y)
pred <- predict(fit, type="probs")
pred


###################################################
### code chunk number 7: glmpathcr.Rnw:125-126
###################################################
fit <- glmpathcr(x, y, method="forward")


###################################################
### code chunk number 8: glmpathcr.Rnw:129-131
###################################################
coefficients<-coef(fit, s=BIC.step)
nonzero.coef(fit, s=BIC.step)


###################################################
### code chunk number 9: glmpathcr.Rnw:135-137
###################################################
pred <- predict(fit)
table(pred, y)


