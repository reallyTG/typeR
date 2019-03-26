library(MixedPsy)


### Name: xplode
### Title: Extract values from a fitted GLMM object
### Aliases: xplode
### Keywords: GLMM

### ** Examples

library(lme4)
datafr = PsySimulate(nsubjects = 10)
mod1 = glmer(formula = cbind(Longer, Total - Longer) ~ X + (1 | Subject),
family = binomial(link = "probit"), data = datafr)
xplode.mod1 = xplode(model = mod1, name.cont = "X")
MixDelta(xplode.mod1)




