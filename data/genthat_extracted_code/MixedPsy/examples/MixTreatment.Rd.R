library(MixedPsy)


### Name: MixTreatment
### Title: PSE/JND for Multivariable GLMM Using Delta Methods
### Aliases: MixTreatment
### Keywords: DeltaMethod GLMM Multivariable

### ** Examples

library(lme4)
data(vibro_exp3)
formula.mod <- cbind(faster, slower) ~ speed * vibration + (1 + speed| subject)
mod <- glmer(formula = formula.mod, family = binomial(link = "probit"), data = vibro_exp3)
xplode.mod <- xplode(model = mod, name.cont = "speed", name.factor = "vibration")
MixTreatment(xplode.mod, vibro_exp3)




