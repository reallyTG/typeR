### R code from vignette source 'glmnetcr.Rnw'

###################################################
### code chunk number 1: glmnetcr.Rnw:75-76
###################################################
options(prompt="R> ", continue="+  ", width=70, useFancyQuotes=FALSE)


###################################################
### code chunk number 2: glmnetcr.Rnw:78-86
###################################################
library("glmnetcr")
data("diabetes")
dim(diabetes)
names(diabetes)[1:10]
summary(diabetes$y)
x <- diabetes[, 2:dim(diabetes)[2]]
y <- diabetes$y
fit <- glmnetcr(x, y)


###################################################
### code chunk number 3: glmnetcr.Rnw:89-90
###################################################
print(fit)


###################################################
### code chunk number 4: glmnetcr.Rnw:94-95
###################################################
plot(fit, xvar = "step", type = "bic")


###################################################
### code chunk number 5: glmnetcr.Rnw:103-104
###################################################
plot(fit, xvar = "step", type = "coefficients")


###################################################
### code chunk number 6: glmnetcr.Rnw:111-113
###################################################
plot(fit, xvar = "step", type = "bic")
plot(fit, xvar = "step", type = "coefficients")


###################################################
### code chunk number 7: glmnetcr.Rnw:117-121
###################################################
BIC.step <- select.glmnetcr(fit)
BIC.step
AIC.step <- select.glmnetcr(fit, which = "AIC")
AIC.step


###################################################
### code chunk number 8: glmnetcr.Rnw:124-128
###################################################
coefficients<-coef(fit, s = BIC.step)
coefficients$a0
sum(coefficients$beta != 0)
nonzero.glmnetcr(fit, s = BIC.step)


###################################################
### code chunk number 9: glmnetcr.Rnw:132-133
###################################################
fit <- glmnetcr(x, y, method = "forward")


###################################################
### code chunk number 10: glmnetcr.Rnw:136-138
###################################################
BIC.step <- select.glmnetcr(fit)
BIC.step


###################################################
### code chunk number 11: glmnetcr.Rnw:142-146
###################################################
coefficients<-coef(fit, s = BIC.step)
coefficients$a0
sum(coefficients$beta != 0)
nonzero.glmnetcr(fit, s = BIC.step)


###################################################
### code chunk number 12: glmnetcr.Rnw:151-154
###################################################
hat<-fitted(fit, s = BIC.step)
names(hat)
table(hat$class, y)


