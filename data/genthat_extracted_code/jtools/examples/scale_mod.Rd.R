library(jtools)


### Name: scale_mod
### Title: Scale variables in fitted regression models
### Aliases: scale_mod scale_mod.default scale_lm

### ** Examples


fit <- lm(formula = Murder ~ Income * Illiteracy,
          data = as.data.frame(state.x77))
fit_scale <- scale_mod(fit)
fit_scale <- scale_mod(fit, center = TRUE)

# With weights
fitw <- lm(formula = Murder ~ Income * Illiteracy,
           data = as.data.frame(state.x77),
           weights = Population)
fitw_scale <- scale_mod(fitw)
fitw_scale <- scale_mod(fitw, center = TRUE, binary.input = "0/1")

# With svyglm
if (requireNamespace("survey")) {
library(survey)
data(api)
dstrat<-svydesign(id=~1,strata=~stype, weights=~pw, data=apistrat, fpc=~fpc)
regmodel <- svyglm(api00~ell*meals,design=dstrat)
regmodel_scale <- scale_mod(regmodel)
regmodel_scale <- scale_mod(regmodel, binary.input = "0/1")
}




