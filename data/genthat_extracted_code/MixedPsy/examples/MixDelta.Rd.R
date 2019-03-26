library(MixedPsy)


### Name: MixDelta
### Title: PSE/JND for Univariable GLMM Using Delta Methods
### Aliases: MixDelta
### Keywords: DeltaMethod GLMM Univariable

### ** Examples

library(lme4)
data(vibro_exp3)
formula.mod <- cbind(faster, slower) ~ speed + (1 + speed| subject)
mod <- glmer(formula = formula.mod, family = binomial(link = "probit"), 
              data = vibro_exp3[vibro_exp3$vibration == 0,])
define.mod <- list(pf = list(intercept = 1, slope = 2))
xplode.mod <- xplode(model = mod, name.cont = "speed", define.pf = define.mod)
pse.jnd <- MixDelta(xplode.mod)




