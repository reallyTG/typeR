library(VGAM)


### Name: anova.vglm
### Title: Analysis of Deviance for Vector Generalized Linear Model Fits
### Aliases: anova.vglm
### Keywords: htest

### ** Examples

# Example 1: a proportional odds model fitted to pneumo.
set.seed(1)
pneumo <- transform(pneumo, let = log(exposure.time), x3 = runif(8))
fit1 <- vglm(cbind(normal, mild, severe) ~ let     , propodds, pneumo)
fit2 <- vglm(cbind(normal, mild, severe) ~ let + x3, propodds, pneumo)
fit3 <- vglm(cbind(normal, mild, severe) ~ let + x3, cumulative, pneumo)
anova(fit1, fit2, fit3, type = 1)  # Remember to specify 'type'!!
anova(fit2)
anova(fit2, type = "I")
anova(fit2, type = "III")

# Example 2: a proportional odds model fitted to backPain.
data("backPain", package = "VGAM")
backPain$x1 <- factor(backPain$x1)
backPain$x2 <- factor(backPain$x2)
backPain$x3 <- factor(backPain$x3)
summary(backPain)
fitlogit <- vglm(pain ~ x1 * x2 * x3, propodds, data = backPain)
coef(fitlogit)
anova(fitlogit)
anova(fitlogit, type = "I")
anova(fitlogit, type = "III")



