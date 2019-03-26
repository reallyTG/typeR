library(pubh)


### Name: coef_det
### Title: Coefficient of determination.
### Aliases: coef_det

### ** Examples

## Linear regression:
Riboflavin <- seq(0, 80, 10)
OD <- 0.0125*Riboflavin + rnorm(9, 0.6, 0.03)
titration <- data.frame(Riboflavin, OD)
model1 <- lm(OD ~ Riboflavin, data=titration)
summary(model1)
coef_det(titration$OD, fitted(model1))

## Non-linear regression:
library(nlme)
data(Puromycin)
mm.tx <- gnls(rate ~ SSmicmen(conc, Vm, K), data=Puromycin, subset=state=="treated")
summary(mm.tx)
coef_det(Puromycin$rate[1:12], mm.tx$fitted)



