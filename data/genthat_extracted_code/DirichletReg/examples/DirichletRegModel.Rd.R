library(DirichletReg)


### Name: DirichletRegModel
### Title: Methods for the Class 'DirichletRegModel'
### Aliases: print.DirichletRegModel summary.DirichletRegModel
###   fitted.DirichletRegModel predict.DirichletRegModel
###   residuals.DirichletRegModel logLik.DirichletRegModel
###   AIC.DirichletRegModel BIC.DirichletRegModel nobs.DirichletRegModel
###   vcov.DirichletRegModel update.DirichletRegModel
###   confint.DirichletRegModel drop1.DirichletRegModel
###   print.DirichletRegConfint

### ** Examples

ALake <- ArcticLake
ALake$AL <- DR_data(ArcticLake[, 1:3])

mod1 <- DirichReg(AL ~ depth + I(depth^2) | depth, data = ALake, model="alternative")

update(mod1, . ~ . | . + I(depth^2), evaluate = FALSE)
mod1

drop1(mod1)   ### issues a caveat when used for the first time in an R session

summary(mod1)

head(fitted(mod1))

predict(mod1, newdata = data.frame("depth" = seq(10, 100, 10)))

head(residuals(mod1))

confint(mod1)
confint(mod1, exp = TRUE)

logLik(mod1)
round(vcov(mod1), 5)



