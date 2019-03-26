library(jtools)


### Name: center_mod
### Title: Center variables in fitted regression models
### Aliases: center_mod center_lm

### ** Examples


fit <- lm(formula = Murder ~ Income * Illiteracy,
          data = as.data.frame(state.x77))
fit_center <- center_mod(fit)

# With weights
fitw <- lm(formula = Murder ~ Income * Illiteracy,
           data = as.data.frame(state.x77),
           weights = Population)
fitw_center <- center_mod(fitw)

# With svyglm
if (requireNamespace("survey")) {
library(survey)
data(api)
dstrat <- svydesign(id = ~1, strata = ~stype, weights = ~pw,
                    data = apistrat, fpc =~ fpc)
regmodel <- svyglm(api00 ~ ell * meals, design = dstrat)
regmodel_center <- center_mod(regmodel)
}




